#! /bin/env python3
import atexit
import logging
import os
import signal
import subprocess
import sys
import threading
import time
import sd_notify
import yaml

from utils import day_time, display, gpio, vlcplayer


##################
# Initialisation #
##################

# exit handlers
@atexit.register
def cleanup():
    global exit_threads, devmode
    try:
        logging.info('Stopping...')
        if not exit_threads:
            exit_threads = True
            stopmusic()
            disp.close()
            gpio.clean()
            time.sleep(5)
    except Exception as exc:
        logging.warning('An exception that occurred on exit was ignored:\n' + str(exc))


def sighandler(signo, frame):
    logging.info('SIGTERM signal (' + str(signo) + ') intercepted')
    cleanup()


signal.signal(signal.SIGTERM, sighandler)

# Systemd
notify = sd_notify.Notifier()
if not notify.enabled():
    logging.warning('Systemd watchdog is not enabled')

# Logging
VERSION = 'WeckPi v1.3.2'
logging.basicConfig(format='[%(levelname)s] %(message)s', level=logging.DEBUG)
logging.info(VERSION)

# Settings
CONFIG_FILE = '/etc/weckpi/config.yaml'
SETTINGS_CHANGED_FILE = '/etc/weckpi/settings-changed'
config = {}
alarm_stat = False


def parseconfig():
    global config
    logging.debug('Parsing settings')
    config = {}
    try:
        with open(CONFIG_FILE) as f:
            config = yaml.load(f, Loader=yaml.FullLoader)
            f.close()
    except Exception as exc:
        logging.error('Failed to parse settings:\n' + str(exc))
    check_alarmtimes()


def checkforparse():
    if os.path.exists(SETTINGS_CHANGED_FILE):
        logging.info('Settings reparsing needed')
        parseconfig()
        try:
            os.remove(SETTINGS_CHANGED_FILE)
        except Exception as exc:
            logging.error('Failed to remove settings-changed-indicator-file:\n' + str(exc))


alarmtime = ''
alarmday = ''
override = False


def check_alarmtimes():
    global alarmtime, alarmday, override
    if config['alarmtimes']['override']['active']:
        if day_time.comparetimes(day_time.timenow(), config['alarmtimes']['override']['time']) >= 2:
            alarmday = day_time.nextday(day_time.daynow())
        else:
            alarmday = day_time.daynow()
        alarmtime = config['alarmtimes']['override']['time']
        override = True
    else:
        day = day_time.daynow()

        if day_time.comparetimes(day_time.timenow(), config['alarmtimes'][day]["time"]) == 3:
            to_late = True
        else:
            to_late = False

        while not config["alarmtimes"][day]["active"] or to_late:
            to_late = False
            day = day_time.nextday(day)
            if day == day_time.daynow():
                alarmtime = ''
                alarmday = ''
                return
        alarmday = day
        alarmtime = config["alarmtimes"][day]["time"]


# Display
display_stat = False
last_time = ''
try:
    disp = display.I2CDisplay(16, 2, "A00", "PCF8574", 0x3f, 1)
    if True:
        disp.write(VERSION)
        disp.newline()
        disp.write('Initializing...')
        time.sleep(5)
except Exception as ex:
    logging.critical('Failed to initialize display:\n' + str(ex))
    sys.exit(2)


def display_on():
    logging.debug('Display on')
    global last_time, display_stat
    last_time = ''
    display_stat = True
    try:
        disp.backlight(True)
    except Exception as exc:
        logging.error('Failed to set backlight state of the display:\n' + str(exc))


def display_off():
    logging.debug('Display off')
    global display_stat
    display_stat = False
    try:
        disp.backlight(False)
        disp.clear()
    except Exception as exc:
        logging.error('Failed to set backlight state and clear the display:\n' + str(exc))


# Buttons
button_disp = gpio.Button(16)
button_music = gpio.Button(18)

# Sound
speaker = gpio.Output(11)
speaker.setstate(False)

music = vlcplayer.RandomPlaylist("/etc/weckpi/music.json")
radio_stat = False
stoptimer = None


def playmusic():
    logging.debug('Music on')
    global radio_stat, stoptimer
    if not radio_stat:
        speaker.setstate(True)
        try:
            music.set_volume(100)
            music.play()
        except Exception as exc:
            logging.error('Failed to play music:\n' + str(exc))
        radio_stat = True
        stoptimer = threading.Timer(3600, stopmusic)
        stoptimer.start()


def stopmusic():
    logging.debug('Music off')
    global radio_stat, alarm_stat, stoptimer
    if radio_stat:
        try:
            music.stop()
        except Exception as exc:
            logging.error('Failed to stop music:\n' + str(exc))

        speaker.setstate(False)

        if stoptimer is not None:
            stoptimer.cancel()
            stoptimer = None

        if alarm_stat:
            alarm_stat = False
            if override:
                parseconfig()
                config['alarmtimes']['override']['active'] = False
                with open(CONFIG_FILE, 'w') as file:
                    yaml.dump(config, file)
                    file.close()
            check_alarmtimes()
        radio_stat = False


def nextsong():
    logging.debug('Next music track')
    try:
        music.next()
    except Exception as exc:
        logging.error('Failed to play next track:\n' + str(exc))


parseconfig()


# Threads
def t_disp():
    global last_time
    while True:
        if exit_threads:
            return
        if display_stat:
            time_now = day_time.timenow()
            try:
                if last_time != time_now:
                    disp.clear()
                    disp.write('Zeit: ' + time_now)
                    disp.newline()
                    if alarm_stat:
                        disp.write('Wecker klingelt!')
                    else:
                        disp.write('     ' + alarmtime + ' (' + alarmday + ')')
                    last_time = time_now
            except Exception as exc:
                logging.error('Failed to write to display:\n' + str(exc))


def t_alarm():
    global alarm_stat
    while True:
        if exit_threads:
            return
        if day_time.timenow() == alarmtime and alarmday == day_time.daynow() and not alarm_stat:
            alarm_stat = True
            playmusic()

# Start threads
threads = []
exit_threads = False
try:
    thread_disp = threading.Thread(target=t_disp)
    threads.append(thread_disp)
    thread_alarm = threading.Thread(target=t_alarm)
    threads.append(thread_alarm)

    for thread in threads:
        thread.start()

except Exception as ex:
    logging.critical('Failed to start threads:\n' + str(ex))
    sys.exit(1)

logging.info('Started threads')

display_off()
if notify.enabled():
    notify.ready()
logging.info('Initialisation finished')

while True:
    if exit_threads:
        break
    checkforparse()

    if button_disp.getstate():
        time.sleep(0.5)
        if button_disp.getstate():
            time.sleep(2)
            if button_disp.getstate():
                logging.info('Application restart called by user')
                subprocess.run(['weckpictl', 'restart'])
                continue
        try:
            display_on()
            time.sleep(10)
            display_off()
            time.sleep(2)
        except Exception as ex:
            logging.error('Failed to toggle display:\n' + str(ex))

    if button_music.getstate():
        time.sleep(0.5)
        if button_music.getstate():
            time.sleep(2)
            if button_music.getstate():
                if radio_stat:
                    nextsong()
                else:
                    logging.info('System shutdown called by user')
                    subprocess.run(['sudo', 'poweroff'])
                time.sleep(2)
                continue
        if radio_stat:
            stopmusic()
        else:
            playmusic()
        time.sleep(2)
