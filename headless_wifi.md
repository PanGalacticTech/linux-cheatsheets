# Headless Raspberry Pi Setup *WiFi Settings*

Follow these steps to set up a headless raspberry pi on wifi:


You will need to define a

`wpa_supplicant.conf`

file for your particular wireless network.
Put this file in the boot folder, and when the Pi first boots,
it will copy that file into the correct location in the Linux root file system 
and use those settings to start up wireless networking.


## wpa_supplicant.conf file example


> ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev    <br>
> update_config=1                                            <br>
> country=GB                                                 <br>
>                                                            <br>
> network={                                                  <br>
> ssid="[Name of your wireless LAN]"                         <br>
> psk="[Password for your wireless LAN]"                     <br>
> `# Following line added later:`                            <br>
> key_mgmt=WPA-PSK                                           <br>
> }                                                          <br>  <br>



## Installing Chromium

`sudo apt-get install chromium-browser`


