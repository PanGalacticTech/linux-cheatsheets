# Guide to Networking & Nettools


## Hostname

hostname is saved in file

`/etc/hosts`

## DHCP & dhcpcd file

Check if dhcpcd service is running 

`sudo service dhcpcd status`

In case it’s not, activate DHCPCD as follows:

`sudo service dhcpcd start`
`sudo systemctl enable dhcpcd`


### dhcpcd.conf example

```
interface eth0
static ip_address=192.168.0.4/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1

```

## avahi - deamon

avahi ensures hostname is recorded by DNS, makes hostname.local work

Check if service is runnin

` sudo systemctl status avahi-daemon`

To check files

`systemctl list-unit-files "*avahi*"`

To restart Service
`sudo systemctl enable avahi-daemon.service`

to disable service

`sudo systemctl stop avahi-deamon` <br>
`sudo systemctl disable avahi-daemon`




## NMAP GUIDE

Scan IPs on Network XX.XX.XX

`sudo nmap XX.XX.XX.* -rP`

* Note. Dont know what flags do but -rP seems useful

`-rP`   Dont know but lots of info - no device type


`-sP`   Reports back device types

`-sP` has been replaced with `-sn` as the preferred way to do ping scans, while skipping port scanning.

`-sL`  Lists the hosts in the network(s) given to nmap and does reverse-DNS lookups on each address so that hostnames can be shown as well.

Run as admin if Not seeing Hostnames


> `-n` no reverse DNS <br>
> `-Pn` no host discovery <br>
> `-sn` no port scan <br>



https://raspberrypi.stackexchange.com/questions/124755/using-wired-and-wireless-connection-simultaniously-on-raspberry-pi-4
