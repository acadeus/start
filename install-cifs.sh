#!/bin/sh


# install needed packages
apt install cifs-utils

# mounting srv1
if ! [ -d /mnt/srv1 ]
then
	echo add /mnt/srv/
        mkdir /mnt/srv1
else
	echo /mnt/srv/ already there
fi

if !  grep -q "/mnt/srv1" /etc/fstab
then
	echo add entry to fstab
	echo "//srv1/linux /mnt/srv1 cifs rw,noauto,user,username=linuxclient 0 0" >> /etc/fstab

else
	echo fstab already served

fi

echo reload fstab
mount -a
