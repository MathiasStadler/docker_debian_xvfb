#!/bin/bash

# # start_container_raspi_debian_xvfb.sh from command line

# docker run -it \
# -p 2222:22 \
# -p 5959:5900 \
# debian_lxde_xvfb bash


# docker run -it \
# -p 2222:22 \
# -p 5959:5900 \
# --hostname multi_stage \
# debian_lxde_xvfb_multi_stage bash

# docker run -it  -p 5900:5900 --hostname stage_r7 debian_stage_s7

# # su - user funzt
# # --cap-add FROM HERE
# # https://www.redhat.com/sysadmin/container-permission-denied-errors
# docker run -it \
# --security-opt apparmor=unconfined \
# --cap-add SYS_ADMIN \
# --cap-add CAP_SYSLOG \
# --cap-add CAP_PERFMON \
# --cap-add CAP_BPF \
# --cap-add CAP_CHECKPOINT_RESTORE \
# --cap-add CAP_NET_RAW \
# --cap-add CAP_SYS_CHROOT \
# --cap-add CAP_AUDIT_WRITE \
# --cap-add CAP_MKNOD \
# --tmpfs /run \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --device /dev/snd \
# --device /dev/dri \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --volume ./workspace:/home/user/workspace:rw \
# --env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
# --group-add "$(getent group audio | cut -d: -f3)" \
# --hostname debian_stage_s8_cap_complete \
# -p 2222:22 \
# -p 5959:5900 \
# debian_stage_s8

# ## /w docker run -it --userns host --privileged --security-opt=seccomp=unconfined --mount type=bind,src="$(pwd)",target=/src

# docker run -it \
# --security-opt apparmor=unconfined \
# --cap-add SYS_ADMIN \
# --cap-add CAP_SYSLOG \
# --cap-add CAP_PERFMON \
# --cap-add CAP_BPF \
# --cap-add CAP_CHECKPOINT_RESTORE \
# --cap-add CAP_NET_RAW \
# --cap-add CAP_SYS_CHROOT \
# --cap-add CAP_AUDIT_WRITE \
# --cap-add CAP_MKNOD \
# --tmpfs /run \
# --volume /sys/fs/cgdocker run -it \
# --security-opt apparmor=unconfined \
# --cap-add SYS_ADMIN \
# --cap-add CAP_SYSLOG \
# --cap-add CAP_PERFMON \
# --cap-add CAP_BPF \
# --cap-add CAP_CHECKPOINT_RESTORE \
# --cap-add CAP_NET_RAW \
# --cap-add CAP_SYS_CHROOT \
# --cap-add CAP_AUDIT_WRITE \
# --cap-add CAP_MKNOD \
# --tmpfs /run \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --device /dev/snd \
# --device /dev/dri \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --volume workspace_rust:/home/user/workspace_rust:rw \
# --env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
# --group-add "$(getent group audio | cut -d: -f3)" \
# --hostname debian_stage_s8_cap_complete \
# -p 2222:22 \
# -p 5959:5900 \
# debian_stage_s8roup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --volume ./workspace:/home/user/workspace:rw \
# --env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
# --group-add "$(getent group audio | cut -d: -f3)" \
# --hostname debian_stage_s8_cap_complete \
# -p 2222:22 \
# -p 5959:5900 \
# --userns host \
# --privileged \ 
# --security-opt=seccomp=unconfined \
# --mount type=bind,src="$(pwd)",target=/home/user/folder \
# debian_stage_s8

# ## w/o apparmor and workspace
# docker run -it \
# --tmpfs /run \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --device /dev/snd \
# --device /dev/dri \
# --volume /sys/fs/cgroup:/sys/fs/cgroup \
# --volume /dev/shm:/dev/shm \
# --env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
# --volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
# --group-add "$(getent group audio | cut -d: -f3)" \
# --hostname debian_stage_s8_w/o_sec \
# -p 2222:22 \
# -p 5959:5900 \
# debian_stage_s8

# /w volumes



# service --status-all
# service ssh start
# service ssh stop

# echo "${USER}:user" | chpasswd

# git config --global user.email "stadler-mathias@web.de"
# git config --global user.name "Mathias Stadler"

# sudo netstat -tulpn | grep LISTEN

docker run -it \
--security-opt apparmor=unconfined \
--cap-add SYS_ADMIN \
--cap-add CAP_SYSLOG \
--cap-add CAP_PERFMON \
--cap-add CAP_BPF \
--cap-add CAP_CHECKPOINT_RESTORE \
--cap-add CAP_NET_RAW \
--cap-add CAP_SYS_CHROOT \
--cap-add CAP_AUDIT_WRITE \
--cap-add CAP_MKNOD \
--tmpfs /run \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--volume workspace_rust:/home/user/workspace_rust:rw \
--env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--group-add "$(getent group audio | cut -d: -f3)" \
--hostname debian_stage_s8_3_cap_complete \
-p 2223:22 \
-p 5960:5900 \
debian_stage_s8_3

# docker inspect <container id>
# docker inspect 4afd7d8722be