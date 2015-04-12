#!/bin/bash

# TEST
sed -i 's/"storage_path" : "\/var\/lib\/btsync\/",/"storage_path" : "\/config/",/g' /etc/btsync/debconf-default.conf
