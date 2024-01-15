#!/bin/bash
echo "what would you like to call this host"
read "hostname"

echo "alias='ls -al'" >> /etc/profile
######## installing Packages ###########
sudo apt-get install dnsutils #nslookup and dig
sudo apt-get install apache2
######
touch /home/h.junaid/.credentials
echo "username=download" >> /home/h.junaid/.credentials
chmod 600
sudo mkdir /backup
sudo echo "//192.168.1.5/Open_Share /backup cifs credentials=/home/h.junaid/.credentials,rw,uid=1001,gid=1001" >> /etc/fstab
sudo groupadd admin
sudo usermod -aG admin h.junaid
######## Adding hostname ####
######## 
