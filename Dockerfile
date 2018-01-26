FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
ENV PROCESSHOME /waterfall
ADD start.sh /start.sh
RUN apt-get clean-all
RUN useradd -d /waterfall -s /bin/bash -m waterfall
CMD sh /start.sh
