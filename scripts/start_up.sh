#!/usr/bin/bash


## startup/init script for this container


check_inside_container() {
# FROM HERE
# https://unix.stackexchange.com/questions/607695/how-to-check-if-its-docker-or-host-machine-inside-bash-script
if grep -q docker /proc/1/cgroup; then 
   echo inside docker 
else
   echo on host
   exit
fi

}

start_bash() {

/usr/bin/bash

}

check_inside_container &
start_bash &
# and add this at the end
exec "$@"
