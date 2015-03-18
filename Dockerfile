FROM jenkins
MAINTAINER Andrew Gorton

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
