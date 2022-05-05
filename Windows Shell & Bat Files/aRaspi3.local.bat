@echo off
title raspi3_ssh
:start
echo Attempting Connection with raspberrypi3.local
echo for help see: https://www.makeuseof.com/tag/essential-windows-cmd-commands/
ssh pi@raspberrypi3.local
echo Closing Connection...
set choice=
set /p choice="Do you want to restart? Press 'y' and enter for Yes: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto start
pause
