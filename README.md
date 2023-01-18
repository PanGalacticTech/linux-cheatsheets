# linux-cheatsheets
Cheatsheets of linux commands & Tutorials to help begginers navigate

## Navigating Directories

Change Directory:

`cd <new directory>`<br><br>

## List Files & Folders

list files:
 
`ls`  <br>
  
Include hidden files 

`ls -a`<br>

List ownership:

`ls -l`<br>
  
These can be combined

 `ls -la`<br>
  or  <br>
  `ls -al`<br>


## Directory Manipulation

**Create** a new Directory:

`mkdir <directory name>` <br> <br>

To **move or rename** Directory:

`mv <source_directory> <target_directory>` <br> <br>

To **Delete** a Directory

For an **empty** directory:

`rmdir <directory>`<br>

For a directory that is not empty:
use rm with recursive (-r) flag

`rm -r` <br><br>

## File Manipulation



## Copying Files

# PATH
_What exactly is PATH, why is PATH and how can PATH improve your life?_

https://linuxize.com/post/how-to-add-directory-to-path-in-linux/

to add `/bin` in home directory to path PER USER

`nano ~/.bashrc`

```
~/.bashrc
export PATH="$HOME/bin:$PATH"
```

Global shell specific configuration files such as /etc/environment and /etc/profile. 
Use this file if you want the new directory to be added to ALL system USERS $PATH.


# IP Tools

## NMAP GUIDE

Scan IPs on Network XX.XX.XX

`sudo nmap XX.XX.XX.* -rP`

* Note. Dont know what flags do but -rP seems useful

`-rP`   Dont know but lots of info - no device type


`-sP`   Reports back device types

## On Windows

`arp -a`


