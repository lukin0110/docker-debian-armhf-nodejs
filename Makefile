##################################################################
# Just build the Dockerfile
##################################################################
build-base:
	docker build -t lukin0110/debian-armhf-nodejs-base .

build-0.12.7:
	docker build -t lukin0110/debian-armhf-nodejs:0.12.7 0.12.7

build-4.0.0:
	docker build -t lukin0110/debian-armhf-nodejs:4.0.0 4.0.0

build-4.2.2:
	docker build -t lukin0110/debian-armhf-nodejs:4.2.2 4.2.2

build-5.0.0:
	docker build -t lukin0110/debian-armhf-nodejs:5.0.0 5.0.0


##################################################################
# Shell access to the container
##################################################################
shell-base:
	docker run -t -i lukin0110/debian-armhf-nodejs /bin/bash

shell-debian:
	docker run -t -i resin/beaglebone-black-debian /bin/bash

shell-0.12.7:
	docker run -t -i lukin0110/debian-armhf-nodejs:0.12.7 /bin/bash

shell-4.0.0:
	docker run -t -i lukin0110/udebian-armhf-nodejs:4.0.0 /bin/bash

shell-4.2.2:
	docker run -t -i lukin0110/debian-armhf-nodejs:4.2.2 /bin/bash

shell-5.0.0:
	docker run -t -i lukin0110/debian-armhf-nodejs:5.0.0 /bin/bash

cp-4.2.2:
	docker cp loving_yalow:/usr/local/bin/node node
