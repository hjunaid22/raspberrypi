#!/bin/bash
echo "alias='ls -al'" >> /etc/profile
######## installing cifscloak:- cifs share encryption ###########
#sudo apt install python3-pip -y
#sudo pip3 install git+https://github.com/sudoofus/cifscloak.git --break-system-packages
#sudo python3 -m pip install cifscloak

######
touch /home/h.junaid/.credentials
echo "username=download" >> /home/h.junaid/.credentials
chmod 600
sudo mkdir /backup
sudo echo "//192.168.1.5/Open_Share /backup cifs credentials=/home/h.junaid/.credentials,rw,uid=1001,gid=1001" >> /etc/fstab
sudo groupadd admin
sudo usermod -aG admin h.junaid
######## Adding hostname ####
