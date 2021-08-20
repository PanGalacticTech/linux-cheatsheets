# LAMPserver
Up to Date instructional on setting up LAMP server on Raspbian Buster/Debian 10


Janurary 2020:



1. 
sudo apt update

sudo apt upgrade -y

2.
sudo apt-get install apache2 -y

sudo a2enmod rewrite

sudo service apache2 restart

3.
sudo nano /etc/apache2/apache2.conf 

and change the AllowOverride None to AllowOverride All as shown below:

<Directory /var/www/>

        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
        
</Directory>

…then restart Apache2:

sudo service apache2 restart


4. 
Apache 2 Default page should now be visible on static IP address of RasPi




5.
sudo apt-get install php libapache2-mod-php -y

6.
Create New PHP File and Delete the old HTML index file:

cd /var/www/html

sudo nano index.php


enter simple php test line, eg
<?php echo "Hello World"; ?>

sudo rm index.html

sudo service apache2 restart

7.
Install mysql:

sudo apt-get install mariadb-server mariadb-client php-mysql -y

sudo service apache2 restart


8.
Install phpMyAdmin

In order to manage our MySQL databases, 
it’s far easier to use phpMyAdmin
so let’s go ahead and install it by entering 
the following command, but note* you’ll be asked 
the following questions during the installation process:


Automatic Configuration? – 
Choose

[*]apache2 with your Spacebar,
hit Tab then Enter
Configure database for phpmyadmin with dbconfig-common? – Choose Yes

sudo apt-get install phpmyadmin -y  

THIS DOES NOT WORK IF NOT ON PI. Instead:
look up how to install phpmyadmin on debian 10
https://www.linuxbabe.com/debian/install-phpmyadmin-apache-lamp-debian-10-buster



You should now be able to access phpMyAdmin from browser xxx.xxx.xxx.xxx/phpMyAdmin


OKAY ALT INSTRUCTIONS LANDED US HERE, but some of the rest of this may already be done. watch out.


9. 
Set up FTP:
Now we need to install and setup VSFTPD and lock-down user pi to the /var/www folder, 
so let’s install the FTP service with the following command:

sudo apt-get install vsftpd -y


We need to open the 
sudo nano /etc/vsftpd.conf

file and comment out the following two options:
This:
local_enable=YES
ssl_enable=NO

To This:
#local_enable=YES
#ssl_enable=NO

…then add this code to the very bottom of the file:
# CUSTOM
ssl_enable=YES
local_enable=YES
chroot_local_user=YES
local_root=/var/www
user_sub_token=piftp
write_enable=YES
local_umask=002
allow_writeable_chroot=YES
ftpd_banner=Welcome to my Raspberry Pi FTP service.


pay attention to Umask, not UNmask

# Designate Required FTP Ports. Ensure they are open in UFW
# CUSTOM for use with UFW Firewall

pasv_enable=YES

pasv_min_port=10000

pasv_max_port=11000





10.
Now we need to add a dedicated FTP user called piftp, so we enter the following commands and answer the questions as shown:


sudo adduser piftp


[enter password]

[confirm password]
Full Name: [type your name]
Room Number: [press enter]
Work Phone: [press enter]
Home Phone: [press enter]
Other: [press enter]
Is this information correct?: y [press enter]



11.
We also need to add user piftp to the www-data group,
give ownership of the /var/www folder to www-data user and group, 
change user piftp’s home folder to same, 
and loosen some permissions on the /var/www folder:

sudo usermod -a -G www-data piftp

sudo usermod -m -d /var/www piftp

sudo chown -R www-data:www-data /var/www

sudo chmod -R 775 /var/www


12.
…then restart the VSFTPD service:

edit : has it even been started yet?
sudo service vsftpd restart

13.
Login to FTP (VSFTPD) Service
You can now open your FTP program and setup an FTP connection with the following settings:
Host – 192.xxx.x.xxx (IP address of your Pi with no prefix)
Port – 21
Protocol – FTP (File Transfer Protocol)
Encryption – Use explicit FTP over TLS if available
Logon Type – Normal (username & password)
Username – piftp
Password – [enter password]





14.
Install WordPress
cd /var/www/html
sudo rm -rf ./*
sudo wget http://wordpress.org/latest.tar.gz
Now we want to extract the tarball and move the files into root directory, enter the following commands:
sudo tar xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz

15.
Now let’s check the current ownership and permissions on the files and folder, then change ownership to www-data user with the following commands (don’t forget the dot at the end of chown command):
sudo ls -l
sudo chown -R www-data:www-data .
sudo ls -l

The ls -l command will list all files, folders and their permissions.

16.
Setup WordPress Database
Now we need to create a MySQL user and database for your WordPress installation via the command line, so let’s login to MySQL:
sudo mysql

We should now be in the MySQL command line interface that shows mysql> prompt. To create the WP database user and database, we enter the following commands (note* replace [enter password] with your password, we’ll be using this when we setup WordPress later):

create user 'wordpress'@'localhost' identified by '[enter password]';
create database wordpress;
grant all privileges on wordpress.* to 'wordpress'@'localhost';
flush privileges;
exit;

17.
Back to browser, enter static IP and go through the wordpress setup.

Database Name – wordpress
Username – wordpress
Password – [database password]
Database Host – locahost
Table Prefix – wp741_ (replace 741 with anything you wish, this is for security)

