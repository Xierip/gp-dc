#!/bin/bash

# chance owner to minecraft
# chown -R root:root /data

#only build if jar file does not exist
if [ ! -f /data/spigot.jar ]; then 
  echo "Download spigot jar file"
  cp /spigot.jar /data/spigot.jar
  cp /server.properties /data/server.properties
  chmod +x /data/spigot.jar
fi

cd /data
java -XX:PermSize=128m -XX:MaxPermSize=256m -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:ParallelGCThreads=3 -XX:MaxGCPauseMillis=5 -XX:+UseAdaptiveGCBoundary -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -Xnoclassgc -XX:UseSSE=3 -XX:+UseFastAccessorMethods -XX:+UseStringCache -XX:+UseCompressedStrings -XX:+OptimizeStringConcat -XX:+AggressiveOpts  -Xms24M -Xmx3G -jar spigot.jar
