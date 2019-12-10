#MAINTAINER NAME Eric Wong <eawong12@gmail.com>

#Use debain as base for container
FROM debian:latest
RUN apt -y update && apt -y upgrade

#Download teleport binary
ADD  https://get.gravitational.com/teleport_4.1.4_amd64.deb /tmp/teleport.deb 

#Setup and configure direcotries and Teleport
#using local file for testing
#COPY teleport_4.1.4_amd64.deb /tmp/teleport.deb

RUN apt-get install /tmp/teleport.deb && \
    mkdir -p /usr/local/bin /var/lib/teleport /usr/local/share/teleport && \
    adduser --disabled-password --gecos "" teleport && \
    #cp -f teleport tctl tsh /usr/local/bin && cp -fr app index.html /usr/local/share/teleport/ && \
    rm -rf /tmp/*
EXPOSE 3022 3023 3024 3025 3080
ENTRYPOINT ["/usr/local/bin/teleport", "start"]



