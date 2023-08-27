# WeckPi v1

This is the original WeckPi code.

The core app is built with Python3 and uses systemd and VLC.
The web app is built with JavaScript / React and PHP.

> **Warning** The WeckPi project is currently rebuilt.
> You should not use this code for production.
> You can find the new code under [bennetrr/weckpi](https://github.com/bennetrr/weckpi).

## Installation

Run the following commands to install all files and services.

```bash
git clone https://github.com/bennetrr/graveyard/
cd graveyard/weckpi-v1/

sudo mkdir -vp /etc/weckpi/
sudo chown -v pi /etc/weckpi2
cp -v config.yaml /etc/weckpi/
echo "[]" | tee /etc/weckpi/music.json

sudo mkdir -vp /opt/weckpi/
sudo chown -v pi /opt/weckpi2
cp -v weckpi-base/utils/ weckpi-base/weckpi.py /weckpi-base/playlist_tester.py /opt/weckpi/
cp -v weckpi.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable weckpi.service

sudo cp -v weckpictl.sh /usr/bin/weckpictl
sudo chmod -v +x /usr/bin/weckpictl

curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs apache2 php php-yaml

cd weckpi-web
npm install
npm run build
sudo cp -v build/* /var/www/html

sudo reboot
```

## Usage

### `weckpictl`

```
weckpictl - Script to control the weckpi application

Arguments:
start                             Starts the weckpi application
stop                              Stops the weckpi application
restart                           Restarts the weckpi application
reload-config                     Reloads the weckpi config
status                            Prints the systemctl status for the weckpi application
log                               Shows the entries in journald for the weckpi unit
log-follow                        Shows the entries in journald for the weckpi unit and prints automatically new messages
check-playlist <playlist_file>    Checks if the playlist is valid and contains no unavailable files and escapes characters
help                              Prints the help message
```

### Music

You can change the music source for each day in WeckPi settings (or in the config file).
However, this function was disabled because it caused problems and crashes.

You can edit the playlist by editing the file `/etc/weckpi/music.json`.
Every entry in the array should be a URL with a format that is supported by VLC.
To check if all files are available, you can use the `weckpictl check-playlist` command.
The command also escapes spaces and other special characters, which is necessary.

After editing the file you have to restart the WeckPi.
