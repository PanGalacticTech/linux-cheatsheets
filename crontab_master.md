# Using Crontab to Automate Tasks

Open Crontab file as user account
```
crontab -e
```

or, open Crontab file with sudo permissions

```
sudo crontab -e
```

Crontab commands are written as:
```
minute(0-59) hour(0-23) day(1-31) month(1-12) weekday(0-6) command
```
use asterix to match any value. E.G:
```
# Runs a command on the 42nd minute of the 22nd hour, every day, month and weekday.
42 22 * * * command 
```

Use comma seperated values to specify multiple times

```
# Runs command every 15 minutes
0,14,29,44 * * * * command
```

Each task requires a new line


## Crontab tasks on startuo

```@reboot``` commands run immediatly after linux reboots

```
@reboot [path to command] [argument] {argument 1] [argument 2]
@reboot [path to shell script]
```

### Crontab tasks with delay

To run a job with delay after the system reboots, use sleep command:

```
@reboot sleep [time in seconds] && [path to job]

```




### To check if a crond service is enabled use

```
sudo systemctl status cron.service
```

to enable cron service:

```
sudo systemctl enable cron.service
```


## Crontab & Python

Further work is required to make crontab function with python scripts

1. Add following code to the top of foo.py script:

```
#! /usr/bin/python
```
2. Give execute permission to the script using:

```
chmod a+x foo.py
```

Example:

```
@reboot sleep 60 && usr/bin/python home/pi/python_projects/launch_controller/led_check.py

```


