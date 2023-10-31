#! /bin/bash

while getopts "hve" option
do
case "${option}"
in
e) sudo editor /etc/bupdate/custom.sh && exit;;
v) echo "bupdate &placeholder-version" && exit;;
*) echo "Usage: bupdate [-hve]

To execute the program run it without arguments!

-h  Show this help message
-v  Show version
-e  Opens the custom commands file in your editor" && exit;;
esac
done

if ! test $(id -u) -eq 0; then
    exec sudo "DEBUG=$DEBUG" "$0" "$@"
fi

apt update
apt dist-upgrade -y
apt install -f --yes
apt clean
apt autoremove -y
dpkg-query -l | awk '/^rc/ {print $2}' | xargs -rtd \\n apt purge --yes

FILE=/var/run/reboot-required
if [ -f "$FILE" ]; then
    echo -e "\033[1m\033[33mReboot in 10 seconds\033[0m"
    echo -e "\033[1m\033[33mPress CTRL + C to cancel\033[0m"
    sleep 10s
    reboot

else
    echo -e "\033[1m\033[32mNo reboot required\033[0m"
fi
