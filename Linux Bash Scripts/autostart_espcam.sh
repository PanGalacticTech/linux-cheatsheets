
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

FILE= /home/pi/.config/lxsession/LXDE-pi/autostart.station
if [ -f "$FILE" ] ; then
	echo "$FILE already exists. Are you sure you want to run this script?"
else 
    echo "$FILE Does not exist, renaming autostart"
    cd /home/pi/.config/lxsession/LXDE-pi/
    mv autostart autostart.station   # Rename autostart autostart espcam
	mv autostart.espcam autostart       # rename autostart.station
fi
cd /
echo autostart is now set to ESP CAM
sleep 2

bash /home/pi/asktoreboot.sh