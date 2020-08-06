#!/bin/bash

# set hostname
read -p "Hostnumber (zero padded): " host

echo "coronapi-$host" > /etc/hostname
sed -i "6s/-02/-$host/" /etc/hosts

# enable service
systemctl enable sniff.service

# remove all sensitive data
rm -r /home/pi/.ssh
rm -rf /home/pi/projektarbeit/.git
rm /home/pi/.python_history
echo ""> /home/pi/.bash_history
rm /home/pi/.gitconfig

# blink once
echo "1" > /sys/class/leds/led0/brightness
sleep 5
echo "0" > /sys/class/leds/led0/brightness

poweroff
