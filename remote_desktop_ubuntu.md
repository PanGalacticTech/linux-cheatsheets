# Remote Desktop on Ubuntu

Ubuntu does not have a default VNC server like rapberry pi OS, Options are detailed below




## XRDP

This one is working, using windows remote desktop connection utility

https://help.ubuntu.com/community/xrdp

### Requirements
* XRDP
* Windows Desktop Connection Software (Default win10 install)

### Basic Method


### Problems / Limitations

Dock is not visible, looking for solution

### Detailed Method

> Ignore, use installation script

# Alternative Method

## Automated Via Script

This version worked exeptionally well

https://c-nergy.be/blog/?p=15978

Navigate to Downloads Folder

`cd Downloads`

Download Script File

`wget https://www.c-nergy.be/downloads/xrdp-installer-1.2.2.zip`

Unzip File

`unzip xrdp-installer-1.2.2.zip `

Mark as executable

`chmod +x  ~/Downloads/xrdp-installer-1.2.2.sh`

Run Script as Normal User

 `./xrdp-installer-1.2.2.sh`
 
 OR
 
 Install with customised xrdp login screen
 
  `./xrdp-installer-1.2.2.sh -l`
 
 
 To Uninstall
 
  `./xrdp-installer-1.2.2.sh -r`
  

To restart Server

`sudo /etc/init.d/xrdp restart`



