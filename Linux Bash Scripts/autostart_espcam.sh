
#! /bin/sh
# . ~/.bash_profile
 
# autostart espcam
# navigates to home directory, then to this directory.
# /home/pi/.config/lxsession/LXDE-pi/
# Checks to see if autostart.station exists
# Renames autostart to autostart.station
# Renames autostart.espcam to autostart
# navigates to home

#Asks user if they wish to reboot now.

#if not print to screen changes will be implemented on reboot


echo "Setting ESPcam as startup script"
#cd /
#cd /home/pi/.config/lxsession/LXDE-pi/

#[ -f "/home/pi/.config/lxsession/LXDE-pi/" ] && echo "$FILE exist." || echo "$FILE does not exist."

FILE= /home/pi/.config/lxsession/LXDE-pi/autostart.espcam
if [ -f "$FILE" ] ; then
	echo "$FILE already exists. Are you sure you want to run this script?"
else 
    echo "$FILE Does not exist, renaming autostart"
    cd /home/pi/.config/lxsession/LXDE-pi/
    mv autostart autostart.espcam   # Rename autostart autostart espcam
	mv autostart.station autostart       # rename autostart.station
fi
cd /
echo autostart is now set to station
sleep 2

#echo "Does $USER wish to reboot now?"
#read -n1 -p "Reboot Now? [y,n]" answer
#case $answer in
#	y|Y) echo yes && { sleep 1 } && { echo "...Rebooting Now" } && { sudo reboot };;
#	n|N) echo no && { sleep 1 } && { echo "Reboot manually to apply changes..." } ;;
#	*) echo unsure try rebooting manually ;;



#https://linuxize.com/post/bash-check-if-file-exists/ 
# [ -f /etc/resolv.conf ] && echo "$FILE exist." || echo "$FILE does not exist."

#https://stackoverflow.com/questions/5542016/bash-user-input-if