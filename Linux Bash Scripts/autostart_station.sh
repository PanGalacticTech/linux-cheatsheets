
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

FILE= ./autostart.station
if [ -f "$FILE" ]; then
    echo "$FILE already exists. Are you sure you want to run this script?"
else 
    echo "$FILE Does not exist, renaming autostart"
    mv autostart autostart.station   # Rename autostart autostart espcam
	mv autostart.espcam autostart       # rename autostart.station
fi
cd /

#echo "Does $USER wish to reboot now?"
#read -n1 -p "Reboot Now? [y,n]" answer
#case $answer in
#	y|Y) echo yes && { sleep 1 } && { echo "...Rebooting Now" } && { sudo reboot };;
#	n|N) echo no && { sleep 1 } && { echo "Reboot manually to apply changes..." } ;;
#	*) echo unsure try rebooting manually ;;



#https://linuxize.com/post/bash-check-if-file-exists/ 
#https://stackoverflow.com/questions/5542016/bash-user-input-if