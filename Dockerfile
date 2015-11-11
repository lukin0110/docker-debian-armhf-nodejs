#
# Dockerfile for Node.js development on Ubuntu with an ARM architecture
#
# https://github.com/lukin0110/docker-debian-armhf-nodejs
# uname -a (to check the architecture)
#
# Version: 0.1.0
#

FROM armhfbuild/debian:jessie
MAINTAINER Maarten Huijsmans <maarten@lukin.be>

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["node"]

RUN apt-get update && \
    apt-get install -y --force-yes wget build-essential python python-dev software-properties-common python-software-properties && \
    apt-get install -y --force-yes curl sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

VOLUME ["/app"]