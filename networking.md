# Guide to Networking & Nettools


## Hostname

hostname is saved in file

`/etc/hosts`


## NMAP GUIDE

Scan IPs on Network XX.XX.XX

`sudo nmap XX.XX.XX.* -rP`

* Note. Dont know what flags do but -rP seems useful

`-rP`   Dont know but lots of info - no device type


`-sP`   Reports back device types

`-sP` has been replaced with `-sn` as the preferred way to do ping scans, while skipping port scanning.

