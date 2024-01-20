#!/bin/bash
echo "what would you like to call this host"
read "hostname"

echo "alias ll=ls -al" >> /etc/profile
######## installing Packages ###########
sudo apt-get install dnsutils #nslookup and dig
sudo apt-get install apache2
###### setup smb share to Synology ##########
touch /etc/smbcredentials
echo "username=download\npassword=" >> /etc/smbcredentials
chmod 600 /etc/smbcredentials
sudo mkdir /backup
sudo echo "//192.168.1.5/Open_Share /backup cifs rw,uid=1001,gid=1001,credentials=/etc/smbcredentials >> /etc/fstab
### add \040 for the space 
#//192.168.1.5/Plex/Kids\040Islamic\040Cartoon /Plex cifs credentials=/etc/smbcredentials,rw,uid=1002,gid=1002
sudo groupadd admin
sudo usermod -aG admin h.junaid
useradd download
######## Adding hostname ####
######## 
