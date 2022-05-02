#! /bin/sh
# autostart station
# navigates to home directory, then to this directory.
# /home/pi/.config/lxsession/LXDE-pi/
# Checks to see if autostart.espcam exists
# Renames autostart to autostart.espcam
# Renames autostart.station to autostart
# navigates to home

#Asks user if they wish to reboot now.

#if not print to screen changes will be implemented on reboot


echo "Setting enviroStation as startup script"
cd /
cd /home/pi/.config/lxsession/LXDE-pi/

#FILE= /home/pi/.config/lxsession/LXDE-pi/autostart.espcam
#if [ -f "$FILE" ]; then
#    echo "$FILE already exists. Are you sure you want to run this script?"
#else 
#    echo "$FILE Does not exist, renaming autostart"
rm autostart 						  # Remove autostart
cp autostart.station autostart       # rename autostart.station
#fi
cd /
echo autostart is now set to station
sleep 2

bash /home/pi/asktoreboot.sh

#https://linuxize.com/post/bash-check-if-file-exists/ 
#https://stackoverflow.com/questions/5542016/bash-user-input-if