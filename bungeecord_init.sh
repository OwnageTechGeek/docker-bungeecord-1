#!/bin/bash
if [ "$EULA" != "true" ]; then
  echo "*****************************************************************"
  echo "*****************************************************************"
  echo "** To be able to run bungeecord you need to accept minecrafts EULA **"
  echo "** see https://account.mojang.com/documents/minecraft_eula     **"
  echo "** include -e EULA=true on the docker run command              **"
  echo "*****************************************************************"
  echo "*****************************************************************"
  exit
fi

#only build if jar file does not exist
if [ ! -f /$BUNGEECORD_HOME/bungeecord.jar ]; then 
  echo "Downloading bungeecord jar file, be patient"
  mkdir -p /$BUNGEECORD_HOME/
  cd /$BUNGEECORD_HOME/
  wget http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
  
  #accept eola
  echo "eula=true" > /$BUNGEECORD_HOME/eula.txt

fi

# chance owner to minecraft
chown -R minecraft.minecraft /$BUNGEECORD_HOME/


cd /$BUNGEECORD_HOME/
su - minecraft -c 'java -Xms512M -Xmx1536M -XX:MaxPermSize=128M -jar BungeeCord.jar'

# fallback to root and run shell if spigot don't start/forced exit
bash

