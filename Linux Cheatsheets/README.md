# User Management in Linux

## Change User
`su [USERNAME]`

## Add New Users
https://unix.stackexchange.com/questions/82923/proper-way-to-add-a-user-account-via-bash-script

`sudo adduser [NAME]`

Use the usermod command to add the user to the sudo group.

`usermod -aG sudo username`

By default, on Ubuntu, members of the sudo group have sudo privileges.

Test sudo access on new user account

Use the su command to switch to the new user account.

`su - username`

Then test sudo privilages on new account

## Give User Root Privilages

To make a user root privilages:

Open a Root Terminal and type:

`sudo visudo` 

to access and edit the list

Using the up/down arrows, navigate to the bottom of the sudoers file that is now displayed in the terminal
Just under the line that looks like the following:

`root ALL=(ALL) ALL`

Add the following (replacing user with your actual username):

`user ALL=(ALL) ALL`

Now press Ctrl+X and press Y when promted to save
That's it, your new user now has root privileges!



## Removing Password for Sudoers

Enter into terminal:

`sudo visudo`

Add to end of file (replace <user> with username): 

`<user> ALL=(ALL) NOPASSWD: All`

Save and exit editor.

Run Command
`sudo -k`

This will clear passwork cache

To test try:

`sudo ls` 

Should not be prompted for a password



## Listing Users - Old info please check

List all users using /etc/passwd file

use cat or less

`less /etc/passwd`


each line has seven fields delimited by colons that contain the following information:

> User name
> Encrypted password (x means that the password is stored in the /etc/shadow file)
> User ID number (UID)
> User’s group ID number (GID)
> Full name of the user (GECOS)
> User home directory
> Login shell (defaults to /bin/bash)




> users

`$ getent passwd | head -5`
> root:x:0:0:root:/root:/bin/bash
> bin:x:1:1:bin:/bin:/sbin/nologin
> daemon:x:2:2:daemon:/sbin:/sbin/nologin
> adm:x:3:4:adm:/var/adm:/sbin/nologin
> lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
> groups

`$ getent group | head -5`
> root:x:0:
> bin:x:1:
> daemon:x:2:
> sys:x:3:
> adm:x:4:
> 
The advantage of using getent over just looking at the /etc/passwd and /etc/group files is that getent will
query the system using the system's, <br>

NSS - Name Service Switch, which defines how "databases" such as these should be handled on a given system.

## NSS
The NSS on most Linux systems is controlled through the file /etc/nsswitch.conf.
This file defines the "databases" and then how they should be resolved.

Example In the below you can see that the "database" passwd and group should be provied by files,
but it could be provided by LDAP, NIS, or any number of other methods.

> # /etc/nsswitch.conf

# Example:
> #passwd:    db files nisplus nis
> #shadow:    db files nisplus nis
> #group:     db files nisplus nis

> passwd:     files
> shadow:     files
> group:      files
> #initgroups: files


### Other databases

Passwords and groups are just 2, there are many databases that are accessible via getent. Take a look at the getent man page for a full list.

You can also get the list from getent's usage page.

`$ getent --help`
> ...
> Supported databases:
> ahosts ahostsv4 ahostsv6 aliases ethers group gshadow hosts initgroups
> netgroup networks passwd protocols rpc services shadow
