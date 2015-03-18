FROM jenkins
MAINTAINER Andrew Gorton (http://andrewgorton.uk)

COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
