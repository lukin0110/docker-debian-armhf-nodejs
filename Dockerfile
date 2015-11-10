#
# Dockerfile for Node.js development on Ubuntu with an ARM architecture
#
# https://github.com/lukin0110/docker-ubuntu-armhf-nodejs
#
# Version: 0.0.1
#

# Pull base image.
#FROM mazzolino/armhf-ubuntu:14.04
FROM resin/beaglebone-black-debian
#uname -a (to check the architecture)
MAINTAINER Maarten Huijsmans <maarten.huijsmans@gmail.com>

#ENV NODE_VERSION 0.11.15
ENV NODE_VERSION 0.12.7

RUN apt-get update && \
    apt-get install -y wget build-essential python python-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN wget --no-check-certificate https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz
#RUN wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz
RUN \
    tar -zxvf node-v$NODE_VERSION.tar.gz && \
    cd node-v$NODE_VERSION && \
    ./configure && \
    make && \
    make install

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["node"]
