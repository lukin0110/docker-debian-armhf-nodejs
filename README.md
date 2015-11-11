# docker-ubuntu-armhf-nodejs
Docker images for Node.js development on Debian with an ARM architecture. It ensures that your development 
environment is **consistent** with the ARM based IoT devices that will run the code.

If you're running Node.js on an ARM device you need to compile the `node` binary for the ARM architecture. Some
 `npm` packages have C or C++ code embedded and they need to be compiled as well during installation. 
 
The difference between `x84` and `ARM` architecture may cause unexpected behaviour. These images allow you to 
development Node.js applications on an `ARM` architecture.

## Images
All images are derived from [armhfbuild/debian:wheezy](https://hub.docker.com/r/armhfbuild/debian/) and will build one
specific version of node. It will download the source from the [Node distribution](https://nodejs.org/dist/) page.

## Docker host & ARM Emulation
Your docker host needs to support ARM emulation with [QEMU](http://wiki.qemu.org/Main_Page). The base image includes 
the amd64 version of `qemu-user-static`. This means you can build and run ARM containers on your 64bit machine, as 
explained in [this post](https://groups.google.com/forum/#!msg/coreos-dev/YC-G_rVFnI4/ncS5bjxYWdc). On your host, you 
need to install [qemu-arm-static](https://wiki.debian.org/QemuUserEmulation). Also, the following command must be 
executed before building or running any ARM containers:

```
sudo sh -c 'echo ":arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:" >/proc/sys/fs/binfmt_misc/register'
```

## Troubleshooting
When your copy the `node` binary from the docker image and put it on an ARM device you might receive the following 
error when your execute it:

```
./node: /usr/lib/arm-linux-gnueabihf/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by ./node)
```

This means that the `node` binary on the docker images was build with a newer version of gcc. These binaries are build
 on debian wheezy. You need to upgrade gcc on your device. More info about this issue: 
['GLIBCXX_3.4.20' not found ](http://askubuntu.com/questions/575505/glibcxx-3-4-20-not-found-how-to-fix-this-error) 
and [libstdc-so-6-version-glibcxx-3-4-19-not-found](http://askubuntu.com/questions/306467/usr-lib-i386-linux-gnu-libstdc-so-6-version-glibcxx-3-4-19-not-found/306477#306477).

Copy node from the container:
``` 
docker cp <container_id>:/usr/local/bin/node node
```

### TODO
* explain usage
* explain Vagrant
