# Launcher Scripting With BASH


## Step 1: Make a Launcher Script



```
#!/bin/sh
# launcher.sh
# Navigate to home directory, then to this directory.
# Then execute python script
# Then navigate back to home


cd /
cd home/pi/python_projects/launch_controller/
sudo python3 led_check.py
cd /

```

## Step 2: Make Launcher Executable

`chmod 755 launcher.sh`

Script can be tested with

`sh launcher.sh`


## Step 3: Set up logs Directory for crontab error reports

## Step 4: Add task to crontab file

` crontab -e` (use `sudo crontab -e`) for tasks that require sudo privilages.

### Crontab Task with Logs redirect
```
@reboot sh /home/pi/python_projects/launcher.sh >/home/pi/logs/cronlog 2>&1

```

### Fully Tested Version of Above
With sleep script

```
@reboot sleep 30 && sh /home/pi/python_projects/launch_controller/launcher.sh >/home/pi/logs/cronlog 2>&1
```

## Step 5

Reboot device and check launcher function.

If non functional, check logs file.

`cd logs` <br>
`cat cronlog`


### NOTE:

The shell script is an unnessisary mid step. Python scripts can be run directly from crontab, however this
also explains how to use shell scripts so I will leave it here.

