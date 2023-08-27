#! /bin/bash

function help() {
	echo -e "weckpictl - Script to control the weckpi application\n"
	echo "Arguments:"
	echo "start                             Starts the weckpi application"
	echo "stop                              Stops the weckpi application"
	echo "restart                           Restarts the weckpi application"
	echo "reload-config                     Reloads the weckpi config"
	echo "status                            Prints the systemctl status for the weckpi application"
	echo "log                               Shows the entries in journald for the weckpi unit"
	echo "log-follow                        Shows the entries in journald for the weckpi unit and prints automatically new messages"
	echo "check-playlist <playlist_file>    Checks if the playlist is valid and contains no unavailable files and escapes characters"
	echo "help                              Prints this message"
}

function reload-config() {
	touch /etc/weckpi/settings-changed
	while [ -f /etc/weckpi/settings-changed ]
	do
		sleep 1
	done
	return 0
}

function autoreboot() {
    weckpictl stop
    bupdate
    sudo reboot
}

case $1 in
	start) sudo systemctl start weckpi;;
	stop) sudo systemctl stop weckpi;;
	restart) sudo systemctl restart weckpi;;
	reload-config) reload-config;;
	status) sudo systemctl status weckpi;;
	help) help;;
    log) journalctl -xea --no-pager --unit=weckpi.service;;
    log-follow) journalctl -xea --no-pager --unit=weckpi.service --follow;;
    autoreboot) autoreboot;;
	check-playlist) if [ -z "$2" ]; then echo -e "No playlist file specified"; exit 1; fi; python3 /opt/weckpi/playlist_checker.py "$2";;
	*) echo -e "Incorrect Argument \"$1\"" && help;;
esac
