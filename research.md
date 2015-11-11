# Base images

* https://github.com/djmaze/armhf-ubuntu-docker
* https://github.com/StrictlyBusiness/docker-beaglebone-black-node

# Ubuntu images
```
docker tag -f mazzolino/armhf-ubuntu:14.04 ubuntu:14.04
docker tag -f mazzolino/armhf-ubuntu:14.04 ubuntu:latest
docker tag -f mazzolino/armhf-ubuntu:14.04 ubuntu:trusty

docker tag -f mazzolino/armhf-ubuntu:13.10 ubuntu:13.10
docker tag -f mazzolino/armhf-ubuntu:13.10 ubuntu:saucy

docker tag -f mazzolino/armhf-ubuntu:12.04 ubuntu:12.04
docker tag -f mazzolino/armhf-ubuntu:12.04 ubuntu:precise

# Maybe also the stackbrew images
docker tag mazzolino/armhf-ubuntu:12.04 stackbrew/ubuntu:12.04
```

## Try to build node on ubuntu ARM
```
RUN \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y --force-yes gcc-4.9 g++-4.9
    #update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50 && \
    #update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50

RUN \
    add-apt-repository ppa:terry.guo/gcc-arm-embedded && \
    apt-get update && \
    apt-get install gcc-arm-none-eabi
```
But this didn't succeed :(

# Issues

* https://github.com/OiNutter/node-build/issues/74
* https://github.com/nodejs/node-v0.x-archive/issues/5622
