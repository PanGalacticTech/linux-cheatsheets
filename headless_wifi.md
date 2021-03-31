# Headless Raspberry Pi Setup *WiFi Settings*

Follow these steps to set up a headless raspberry pi on wifi:


You will need to define a

`wpa_supplicant.conf`

file for your particular wireless network.
Put this file in the boot folder, and when the Pi first boots,
it will copy that file into the correct location in the Linux root file system 
and use those settings to start up wireless networking.


## wpa_supplicant.conf file example:


> ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
> update_config=1
> country=GB
>
> network={
> ssid="<Name of your wireless LAN>"
> psk="<Password for your wireless LAN>"
> # Following line added later:
> key_mgmt=WPA-PSK
> }



## Installing Chromium

`sudo apt-get install chromium-browser`

