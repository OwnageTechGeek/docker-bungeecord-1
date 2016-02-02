## Bungeecord server on Ubuntu 14.04 with openjava 1.8

[![Join the chat at https://gitter.im/rehf27/docker-bungeecord](https://badges.gitter.im/rehf27/docker-bungeecord.svg)](https://gitter.im/rehf27/docker-bungeecord?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This docker image builds and runs the bungeecord. 

## Starting the container

To run the lastest stable version of this docker image run

	docker run -ti -p 25565:25565 -e EULA=true rehf27/bungeecord

the parameter

	-e EULA=true

The is because Mojang now requires the end user to access their EULA, located at
https://account.mojang.com/documents/minecraft_eula, the be able to start the server.

the parameter

	-p 25565:25565

tell on witch external port the internal 25565 whould be connected, in this case the same, if
you only type -p 25565 it will connect to a random port on the machine

## Giving the container a name

To make it easier to handle you container you can give it a name instead of the long
number thats normaly give to it, add a

	--name bungeecord

to the run command to give it the name minecraft, then you can start it easier with

	docker start bungeecord
	docker stop bungeecord

## First time run

This will take a couple of minuters depending on computer and network speed. It will pull down
the latest version of Bungeecord. 

If the compilation was successful the server will start in interactive mode. Log in from a minecraft
client to controll that all works. The type

	stop

to drop back to a root shell in the bungeecord directory. Edit and add files to customize your
bungeecord server.

When you are finished do a

	exit

to exit and stop the container

You can now start it in two different modes, interactive and non-interactive mode. 

## Interactive mode

The interactive mode echos server output to the console and you can issue command by type
them in the console. The server stops if you exits the console.

## Non-Interactive mode

The Non-Interactive mode (daemon mode) starts the server without any output. If you need
to connect and do something with the server you have to use the docker exec command.

## Having the minecraft files on the host machine

If you delete the container all your filer in minecraft will be gone. To save them where it's
easier to edit and do a backup of the files you can attach a directory from the host machine
(where you run the docker command) and attach it to the local file system in the container.
The syntax for it is

	-v /host/path/to/dir:/container/path/to/dir

To attach the minecraft directory in the container to directory /home/nimmis/mc-srv you add

	-v /home/nimmis/mc-srv:/bungeecord

## Future features

This is the initial release of this, more features to come.....

