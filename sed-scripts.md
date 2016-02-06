##
Update each Minecraft server's server.properties to disable online-mode, which will force players through the Bungeecord server for access.

- To connect to the shell of a data container

```
docker run --rm -t -i --volumes-from $CONTAINER_NAME centos /bin/bash
```

1. World 0

```
docker run --rm -t -i \
--volumes-from dockerbungeecord_world0data_1 \
centos \
/bin/bash sed -i 's/online-mode=true/online-mode=false/' \ /minecraft/server.properties
\
```
2. World 1

```
docker run --rm -t -i \
--volumes-from dockerbungeecord_world1data_1 \
centos \
sed -i 's/online-mode=true/online-mode=false/' /minecraft/server.properties
```

3. World 2
```
docker run --rm -t -i \
--volumes-from dockerbungeecord_world2data_1 \
centos \
sed -i 's/online-mode=true/online-mode=false/' /minecraft/server.properties
```

## For one Minecraft server

1. Connect to the data container, and run a search and replace command.
```
docker run --rm -t -i \
--volumes-from dockerbungeecord_bungeecorddata_1 \
centos /bin/bash \
sed -i 's/localhost:25565/world0server:25565/' /bungeecord/config.yml
```

## For multiple Minecraft servers
1. Connect to the data container's bash shell
```
docker run --rm -t -i \
--volumes-from dockerbungeecord_bungeecorddata_1 \
centos \
/bin/bash
```

2. Now in the data container's shell, run
```
cd bungeecord
vi config.yml
```

3. Replace the existing servers section with something like this...
```
servers:
  lobby:
    motd: '&1Lobby Server'
    address: world0server:25565
    restricted: false
  newworld:
    motd: '&1A New World'
    address: world1server:25565
    restricted: false
  anotherworld:
    motd: '&1Another World'
    address: world2server:25565
    restricted: false
```
