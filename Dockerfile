FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
ENV PROCESSHOME /waterfall
ADD waterfallstart.sh /waterfallstart.sh
RUN chmod +x /waterfallstart.sh
RUN apt-get clean all
RUN useradd -s /bin/bash -d /waterfall -m waterfall
CMD /waterfallstart.sh

FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
ENV PROCESSHOME /waterfall
ADD start.sh /start.sh
RUN apt-get clean-all
RUN user-add -d /waterfall -s /bin/bash -m waterfall
CMD sh /start.sh
