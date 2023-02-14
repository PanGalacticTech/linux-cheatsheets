@echo off
title DHCP IP SHH
:start
echo Attempting Connection with DHCP IP 
set userName=
set /p userName="Enter SBC User:  "
echo User Set "%userName%"
set hostname=
set /p hostname="Enter Hostname: "
echo Attempting Connection with '%hostname%' as user "%userName%"
ssh "%userName%"@"%hostname%".local
echo Could Not Find "%userName%"@"%hostname%".local, Scanning for IP...
nmap 10.42.0.* -sP | FindRepl /I /N "Raspberry" /O:-2:0  > hostlist.txt
type hostlist.txt | FindRepl  "\d\d?\d?\.\d\d?\d?\.\d\d?\d?\.\d\d?\d?"

echo Could Not find IP or Closed Connection
goto start
pause