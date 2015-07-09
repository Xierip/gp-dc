FROM nimmis/java:openjdk-7-jdk
MAINTAINER nimmis <kjell.havneskold@gmail.com>
RUN apt-get update && apt-get clean all

RUN	   /usr/bin/tzselect Warsaw
RUN     date
RUN     dpkg-reconfigure tzdata
RUN     date
RUN     cat /etc/timezone
ADD    start.sh /start.sh
ADD    ./files/bc.jar /bc.jar

RUN     chmod +x /start.sh

EXPOSE 25577
VOLUME ["/data"]
CMD    ["/start.sh"]
