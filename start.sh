#!/bin/bash

# chance owner to minecraft
# chown -R root:root /data

#only build if jar file does not exist
if [ ! -f /data/spigot.jar ]; then 
  echo "Download spigot jar file"
  wget -O /data/spigot.jar http://tcpr.ca/files/spigot/spigot-1.7.10-SNAPSHOT-b1657.jar
  cp /server.properties /data/server.properties
  chmod +x /data/spigot.jar
fi

cd /data
java -Xms$RamMin -Xmx$RamMax -jar spigot.jar
