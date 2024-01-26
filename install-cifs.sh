#!/bin/sh

read -p "Enter username: " myuser
read -p "Enter groupname: " mygroup


# install needed packages
apt install cifs-utils

# mounting srv1
if ! [ -d /srv1 ]
then
	echo add /srv1
        mkdir /srv1
else
	echo /srv1 already there
fi

if !  grep -q "/srv1" /etc/fstab
then
	echo add entry to fstab
	echo "//srv1/linux /srv1 cifs rw,noauto,uid=$myuser,gid=$mygroup,username=linuxclient 0 0" >> /etc/fstab

else
	echo fstab already served

fi

echo reload fstab
mount -a
