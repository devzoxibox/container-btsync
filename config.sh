#!/bin/bash

# Création du ficher de config
cat <<'EOF' > /config/btsync.conf
{
  "device_name": "unRAID",
  "storage_path" : "/config/.sync",
  "use_upnp" : false,
  "download_limit" : 0,
  "upload_limit" : 0,
  "webui" :
  {
    "listen" : "0.0.0.0:8888"
  }
}
EOF
