##################################################################
# Just build the Dockerfile
##################################################################
build-base:
	docker build -t lukin0110/debian-armhf-nodejs-base .

build-0.12:
	docker build -t lukin0110/debian-armhf-nodejs:0.12 0.12

build-4.x:
	docker build -t lukin0110/debian-armhf-nodejs:4.x 4.x

build-5.x:
	docker build -t lukin0110/debian-armhf-nodejs:5.x 5.x


##################################################################
# Shell access to the container
##################################################################
shell-base:
	docker run -t -i lukin0110/debian-armhf-nodejs-base /bin/bash

shell-debian:
	docker run -t -i armhfbuild/debian:wheezy /bin/bash

shell-0.12:
	docker run -t -i lukin0110/debian-armhf-nodejs:0.12 /bin/bash

shell-4.x:
	docker run -t -i lukin0110/debian-armhf-nodejs:4.x /bin/bash

shell-5.x:
	docker run -t -i lukin0110/debian-armhf-nodejs:5.x /bin/bash

cp-4.2.2:
	docker cp loving_yalow:/usr/local/bin/node node
