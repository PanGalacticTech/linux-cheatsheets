# Headless Raspberry Pi Setup *WiFi Settings*

# BEFORE BOOTING/AFTER FLASHING SD

1. `add SSH file to boot directory` raspberry pi OS APPARENTLY turns ssh on as standard apart from it doesn't

## Turning On Wifi Adaptor

Also something that APPARENtly is turned on already, except when it is not.

2. `  `

Then:

## Setting Up Wifi SSID & PSWD

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


