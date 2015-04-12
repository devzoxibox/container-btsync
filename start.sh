#!/bin/bash


# if minidlna config file doesnt exist then copy default to host config volume
if [ ! -f "/config/debconf-default.conf" ]; then

	# copy over customised config
	cp /etc/btsync/debconf-default.conf /config/
				
fi

# set permissions for user nobody
chmod -R 775 /config/
chown -R nobody:users /config/

exec /usr/lib/btsync/btsync-daemon -d -f /config/debconf-default.conf
