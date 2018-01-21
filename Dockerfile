FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
ENV WATERFALL_HOME /waterfall
ADD waterfall_init.sh /waterfall_init.sh
RUN chmod +x /waterfall_init.sh
RUN apt-get update && apt-get install -y wget git && apt-get clean all
RUN useradd -s /bin/bash -d /waterfall -m waterfall
CMD /waterfall_init.sh
