# bupdate

A small script for keeping Ubuntu / Debian up-to-date.

## Features

The script executes following commands:

- `apt update` - Updates the package informations
- `apt dist-upgrade` - Installs updated packages
- `apt install -f` - Installs missing dependencies
- `apt clean` - Removes cached installation files
- `apt autoremove` - Removes unused dependencies
- `dpkg-query -l | awk '/^rc/ {print $2}' | xargs -rtd \\n apt purge` - Purge uninstalled packages (deletes the configuration files)

After these commands the script checks for `/var/run/reboot-required` and reboots after 10 seconds if needed.
If you don't want to reboot your system, you have to press <kbd>Ctrl</kbd> + <kbd>C</kbd> to cancel it.
When you always want to restart you system after update, you can run `bupdate -e` and write `reboot` on the last line.

## Installation

Just copy the `bupdate.sh` file into `/usr/bin` and make it executable.
