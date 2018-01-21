FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>

#non-interactive installation
ENV DEBIAN_FRONTEND noninteractive

#default directory for SPIGOT-server
ENV WATERFALL_HOME /waterfall

ADD bungeecord_init.sh /bungeecord_init.sh

RUN chmod +x /bungeecord_init.sh

# fast workaround
RUN apt-get update && apt-get install -y wget git && apt-get clean all

# Make special user for waterfall to run in

RUN useradd -s /bin/bash -d /waterfall -m waterfall


#set default command
CMD /waterfall_init.sh
