# Auto Boot in Kiosk Mode

First make a directory for our login settings for user pi
```
mkdir -p /home/pi/.config/lxsession/LXDE-pi/ 
```

Copy autostart file into the directory we just created.
```
cp /etc/xdg/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart 
```

Edit this local version:
```
sudo nano /home/pi/.config/lxsession/LXDE-pi/autostart
```
### Autostart Document Contents
 ```
# Comment out this line to stop desktop environment from loading
 @lxpanel --profile LXDE-pi`
# Comment out this line to stop desktop profile from loading
@pcmanfm --desktop --profile LXDE-pi
#@xscreensaver -no-splash
#@/home/pi/start_browser.sh
#@chromium --kiosk http://pangalactictech.com:3000/d/hjBv7igMz/envirostation-ed$

#@xscreensaver -no-splash  # comment this line out to disable screensaver
@xset s off
@xset -dpms
@xset s noblank
#@chromium-browser --incognito  http://pangalactictech.com:3000/d/hjBv7igMz/env$
@chromium-browser --incognito --kiosk http://pangalactictech.com:3000/d/hjBv7ig$
  # load chromium after boot and point to the localhost webserver in full scree$
@unclutter -idle 20           # Sets unclutter to hide mouse if no movement
#@/home/pi/start_browser.sh   # << if kiosk mode does not work, make sure this file exists and put in command to press F11 instead

```

--------------------------------------------------------------------------------------------------
## To Disable the Mouse Cursor (until movement)

One option would be to install unclutter.

```
sudo apt update
sudo apt install unclutter
```

`unclutter -idle 20     // Number of seconds cursor remains on screen before timeout`

The mouse pointer will appear when moved.

The command can be put in autostart file (See Above)

`/etc/xdg/lxsession/LXDE-pi/autostart`

_____________________________________________________________________________________
# Disable Chromium Update Popup:

This is a bug shown by some versions of chromium, the message is impossible to get rid of as the latest version <br>
of chromium is not alwauys available for ARM processors.


`chromium-browser --check-for-update-interval=1 --simulate-critical-update` <br><br>

Makes chromium check one second after starting. This way, you can see right away if the flag worked or not instead of waiting several hours.

`--check-for-update-interval=1` <br>


While chromium still thinks there is an update, the popup does not appear by itself. It's just an icon:

<br>

### OR ::::

you could try putting this in /etc/chromium-browser/customizations/01-disable-update-check


`CHROMIUM_FLAGS="${CHROMIUM_FLAGS} --check-for-update-interval=31536000"`


### OR ::::

You can try launching Chromium browser with --check-for-update-interval=0. I don't know if it will work or not.
I'm comfortable simply ignoring the notification. Good luck.
```
pi@raspberrypi:~ $ cat ~/.local/share/applications/chromium-browser.desktop
```
[Desktop Entry]

edit line:
```
Exec=chromium-browser --check-for-update-interval=0 %U
```

## OR ::::

This Bug seems to be floating around Debian and Raspbian already since Chromium 76.

From the Debian Report I understand it should be fixed with Chromium 78 and the commandline option
--disable-component-update should disable it.

But from the thread in the Raspberrypi.org Forums it still seems to appear in Chromium 78 at least on Raspbian. 
So there the following workaround is proposed:

Create a file:
```
/etc/chromium-browser/customizations/01-disable-update-check
```

and set its content to:
```
CHROMIUM_FLAGS="${CHROMIUM_FLAGS} --check-for-update-interval=31536000"
```

Or as a copy&paste solution:

```
sudo touch /etc/chromium-browser/customizations/01-disable-update-check;echo CHROMIUM_FLAGS=\"\$\{CHROMIUM_FLAGS\} --check-for-update-interval=31536000\" | sudo tee /etc/chromium-browser/customizations/01-disable-update-check
```


_____________________________________________________________________________________


## NOTES on Autostarting Scripts


To launch a command automatically on login, put the command into a file named
`.bashrc` <br>
in the user directory (for example /home/pi)

For example, the file could contain
```
chromium-browser --kiosk www.google.com
```
to launch Chromium in full-screen pointed to www.google.com

IF problem opening from terminal ->
Try putting the following line just before the one invoking your browser.
```
export DISPLAY=:1
```
The line you had which created an error is probably the right command. 
I am not sure whether 1 is the right display number,
but I have the above line in my .bashrc on a host box I VNC into, 
so I can start GUI apps from command line when I want to.
Since it is coming back with :2100 in your error message, you might try display number :0
Also, I would be concerned about starting the app from your 
.bashrc and not ending the line with an ampersand so that 
.bashrc can finish any other things you might place there in addition, after calling the browser. Otherwise,
.bashrc will not close until you close chromium.


## Alternative Method:

install openbox and have openbox open the bowser for you.
this would give you a fullscreen webbrowser with NOTHING else. no statusbar, no time, no startmenu, nothing but the browser.
Code: Select all

```
sudo aptitude install openbox obconf obmenu 
```
and then make a openbox config file with

```
mkdir -p ~/.config/openbox && cp /etc/xdg/openbox/* ~/.config/openbox
```

Then edit the autostart to openthe browser at boot

```
nano ~/.config/openbox/autostart
```
remove all the code and past this in:
```
# Autostart script
#will sleep to make sure everything else loads
sleep 5s && midori  --inactivity-reset=120 -e Fullscreen --app=/PATH/TO/HOMEPAGE/FILE.html
```
that will make it run with fewer options auto resetting after 2 minutes inactivity


## Alternative Method 2:

I have got it working. It seems you can't start chromium from bash as it there is no gui so fails.

I got chromium to start on boot by adding
```
"@chromium --kiosk www.bbc.co.uk" 
```
to the "autostart" file in /etc/xdg/lxsession/LXDE/

## Alternative Method 3:

I solved using autostart of LXDE-pi and a sh file with epiphany browser.

I had to install xautomation for simulate an user input

```
sudo aptitude install xautomation
```

In the home of pi I've created a sh file

```
touch start_browser.sh
```

I've inserted the following code in the file

```
# running the browser on the main desktop
sudo -u pi epiphany-browser -a --profile ~/.config http://www.google.com/ --display=:0 & 
# waits a few seconds, we wait that the browser has started successfully   
sleep 15s;
# xautomation simulates the pressure on the F11 key for activate the browser in full screen mode on the main desktop
xte "key F11" -x:0
```

I added the executable permission on the sh file with chmod command

```
sudo chmod 755 start_browser.sh
```
I've modified the autostart files of LXDE-pi session

```
sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
```
by adding the following command to run my sh file

```
@/home/pi/start_browser.sh
```

Now our browser should be start in full screen mode at each boot

If it does not, check that the Raspberry's configuration had enabled the boot into the desktop environment
```
sudo raspi-config
```
Select: 3 Enable Boot to Desktop/Scratch

Select: Desktop Log in as user 'pi' at the graphical desktop

Enjoy

_____________________________________________________________________________________

## THIS BIT WORKED 

Notes#
Yes I had the same problem and the instructions on this stack overflow page helped fix it:
https://raspberrypi.stackexchange.com/q ... e086bdccc2


I have a Raspberry Pi 2 running Raspbian Jessie with Chromium 45 installed. I found that you need to copy the existing autostart file to your local:

mkdir -p /home/pi/.config/lxsession/LXDE-pi/
cp /etc/xdg/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart

So edit this local version:

nano /home/pi/.config/lxsession/LXDE-pi/autostart

#@xscreensaver -no-splash  # comment this line out to disable screensaver
@xset s off
@xset -dpms
@xset s noblank
@chromium-browser --incognito --kiosk http://localhost/  # load chromium after boot and point to the localhost webserver in full screen mode

In short you need to use the pi user's autostart file in order to launch chromium, not the system wide one.

By default the Pi the auto-logon X environment is done with credentials of the pi user.
The config setting's of the Xserver environment of this user is in 
/home/pi/.config/lxsession/LXDE-pi/autostart,
NOT in /etc/xdg/lxsession/LXDE-pi/autostart 
(this is the environment for the root user).


// Auto Refresh Web Browser

Also, if you just need to refresh a local html file then just embed the following meta line in your html file:

<META HTTP-EQUIV="refresh" CONTENT="30"> <! -- This is to force refresh of this page every 30 seconds>

