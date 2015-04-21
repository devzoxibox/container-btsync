#!/bin/bash


# if minidlna config file doesnt exist then copy default to host config volume
if [ ! -f "/config/btsync.conf" ]; then

	# copy over customised config
	cp /tmp/btsync.conf /config/
				
fi

# set permissions for user nobody
chmod -R 775 /config/
chown -R nobody:users /config/

exec /opt/btsync/btsync --nodaemon --config /config/btsync.conf
