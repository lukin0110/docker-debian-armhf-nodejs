FROM lukin0110/debian-armhf-nodejs-base
MAINTAINER Maarten Huijsmans <maarten.huijsmans@gmail.com>

ENV NODE_VERSION 5.0.0

RUN wget --no-check-certificate https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz
RUN \
    tar -zxvf node-v$NODE_VERSION.tar.gz && \
    cd node-v$NODE_VERSION && \
    ./configure && \
    make && \
    make install
