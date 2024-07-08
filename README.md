# xvfb XTerminal on debian base

## save

docker run -it --mount type=bind,src="$(pwd)",target=/src ubuntu bash

## development container

https://docs.docker.com/guides/workshop/06_bind_mounts/

docker run -it --userns host --privileged --security-opt=seccomp=unconfined ubuntu bash

docker run -it --userns host --privileged --security-opt=seccomp=unconfined --mount type=bind,src="$(pwd)",target=/src ubuntu bash 

docker run -it \
--userns host \
--privileged \
--security-opt=seccomp=unconfined \
--mount type=bind,src="$(pwd)",target=/src \
ubuntu bash

docker run -it \
--cap-add NET_BIND_SERVICE \
--userns host \
--privileged \
--security-opt=seccomp=unconfined \
--mount type=bind,src="$(pwd)"/workspace,target=/src \
debian:stable-slim bash


## remove all containers /w status exited
docker rm -v $(docker ps --filter status=exited -q)

docker ps -a