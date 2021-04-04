# Create a Network Shared Folder Between Linux & Windows

Essentially Samba is a little bit of open source goodness that enables linux and windows computers talk to each other.

# Install Samba

Installing Samba is fairly trivial task and involves you only running 3 commands in the terminal window on your Raspberry Pi.


> SHELL   <br>
> `sudo apt-get update`  <br>
> `sudo apt-get install samba # Answer Yes to DHCP`   <br>
> `sudo apt-get install samba-common-bin`  <br><br>


After we’ve installed samba on our pi, we need to carry out 2 configuration steps.

Create a folder you will use to share and configure samba to share your folder.

Create Public folder to share
Creating a folder to share is really easy, we’ll just create a folder and call it public. 

> SHELL  <br>
> `mkdir public`  <br><br>


### Warning:
We are going to create a permissive share folder on our pi.
If security is a concern, then you may want to read up about the security considerations on Linux.

This how-to primarily about creating a share to enable easy access to your Pi over a network

## Configure Samba

We now need to edit the samba configuration file, so we’ll open the file in nano


> SHELL <br>
> `sudo nano /etc/samba/smb.conf`   <br><br>



We need to edit this file in a few locations.

Firstly, because we are going to access the Pi from a Windows 8 computer, we’ll need to change

> SHELL  <br>
> `# Change the setting`   <br>
> `# Change this to the workgroup/NT-domain name your Samba server will part of `  <br>
> `workgroup = WORKGROUP` <br>
> `wins support = yes`  <br> <br>

Add the following section


> SHELL <br>
> `[PiShare]  `   <br>
> ` comment=Raspberry Pi Share`    <br>
> ` path=/home/pi/public `   <br>
> `browseable=Yes `     <br>
> `writeable=Yes`       <br>
> `only guest=no  `     <br>
> `create mask=0777   ` <br>
> `directory mask=0777   `  <br>
> `directory mask=0777   `  <br>
> `public=no           ` <br><br> 
  
 
 Also added, unsure of its source:
 
> `inherit acls = yes`   <br> 
> `read only = no`        <br>
> `force user = [USER]`    <br>
> `force group = [USER GROUP] `    <br><br>
 
 
 
We now need to exit out of nano so Ctrl + X and save it.

We’ll run a check on the config file to ensure we haven’t broken anything

SHELL
`testparm` <br><br>

We should see something like this

> SHELL    <br>
> `Load smb config files from /etc/samba/smb.conf`       <br>
> `rlimit_max: increasing rlimit_max (1024) to minimum Windows limit (16384)`       <br>
> `Processing section "[homes]"`       <br>
> `Processing section "[printers]"`       <br>
> `Processing section "[print$]"`       <br>
> `Processing section "[public]"`       <br>
> `Loaded services file OK.`       <br>
> `Server role: ROLE_STANDALONE`       <br>       <br>


Press enter to see a dump of your service definitions
Your Pi should now be sharing files on the network!

### Access PI Shared folder on Windows
You should now be able to access your Raspberry Pi shared folder from you windows machine by open files & folders and navigating to \\raspberrypi

### Windows shared on raspberry pi
Double clicking on the public folder you may be prompted for a username and password . The default username is pi and the default password is raspberry

### Password
Once you’ve entered these you are into the shared folder and you can now add, remove and update files as you wish.

### Access Pi Shared Folder on Ubuntu
To Access the same folder from a Ubuntu machine simply open files and folders and click on Connect to Server and enter the same credentials as above, but use the IP address of the Pi

### Ubuntu share
A reminder again that this is a very permissive share and I would strongly advise against leaving it this open, if you plan to connect the Pi to the internet or you’re going to store any particularly sensitive information.


## Create a user with a new password for samba

`sudo smbpasswd -a pi`

to create the pi samba user. On the Windows, I just use RASPBERRYPI\pi as the user, type in the password and it works.