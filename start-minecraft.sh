#!/bin/bash
#Solution borrowed from https://github.com/itzg/dockerfiles/blob/master/minecraft-server/start-minecraft.sh
if [ ! -f /data/eula.txt ]; then
  if [ "$EULA" != "" ]; then
    echo "# Generated via Docker on $(date)" > eula.txt
    echo "eula=$EULA" > /data/eula.txt
  else
    echo ""
    echo "Please accept the Minecraft EULA at"
    echo "  https://account.mojang.com/documents/minecraft_eula"
    echo "by adding the following immediately after 'docker run':"
    echo "  -e EULA=TRUE"
    echo " Or by editing editing eula.txt in your server's data directory"
    echo ""
    exit 1
  fi
fi

cd /data

if [[ "$TRAVIS" = true ]]; then
    echo "stop" | java -jar /minecraft/spigot-1.8.8.jar
else
    java -jar /minecraft/spigot-1.8.8.jar
fi
