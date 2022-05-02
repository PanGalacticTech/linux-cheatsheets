#! /bin/bash
# ask to restart

#https://stackoverflow.com/questions/5542016/bash-user-input-if

echo "Does $USER wish to reboot"
sh sleepx.sh 2
echo "Reboot Now? [y,n]"
read -r input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "yes"
        sleep 1
        echo "...Rebooting Now"
        sudo reboot
else
        echo "don't do that"
fi


#read -n1 -p "Reboot Now? [y,n]" answer
#case $answer in
#        y|Y) echo "yes"  &&  sleep 1  && echo "...Rebooting Now"  &&  sudo reboot ;
#        n|N) echo  "no"  &&  sleep 1  &&  echo "Reboot manually to apply changes..." ;
#        *) echo unsure try rebooting manually ;