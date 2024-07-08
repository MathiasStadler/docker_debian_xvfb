#!/bin/bash

docker run -it \
--userns host \
--privileged \
--security-opt=seccomp=unconfined \
--mount type=bind,src="$(pwd)",target=/home/user/folder \
--security-opt apparmor=unconfined \
--cap-add SYS_ADMIN \
--cap-add CAP_SYSLOG \
--cap-add CAP_PERFMON \
--cap-add CAP_BPF \
--cap-add CAP_CHECKPOINT_RESTORE \
--cap-add CAP_NET_RAW \cat /etc/subuids/fs/cgroup \
--volume /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--hostname debian_stage_s8_cap_complete \
-p 2222:22 \
-p 5959:5900 \
debian_stage_s8