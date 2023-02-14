@echo off
title Static IP SHH
:start
echo Attempting Connection with Static IP 
set userName=
set /p userName="Enter SBC User:  "
echo User Set "%userName%"
set sbcNum=
set /p sbcNum="Enter Number of SBC:  "
echo Attempting Connection with 192.168.1.'%sbcNum%' as user "%userName%"
ssh "%userName%"@192.168.1."%sbcNum%"
echo Closing Connection...
set choice=
set /p choice="Do you want to restart? Press 'y' and enter for Yes: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto start
pause