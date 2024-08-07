#!/bin/bash

# git config --global user.email "stadler-mathias@web.de"
# git config --global user.name "Mathias Stadler"

# sudo netstat -tulpn | grep LISTEN

docker run -it \
--security-opt apparmor=unconfined \
--security-opt seccomp=unconfined \
--cap-add SYS_ADMIN \
--cap-add CAP_SYSLOG \
--cap-add CAP_PERFMON \
--cap-add CAP_BPF \
--cap-add CAP_CHECKPOINT_RESTORE \
--cap-add CAP_NET_RAW \
--cap-add CAP_SYS_CHROOT \
--cap-add CAP_AUDIT_WRITE \
--cap-add CAP_MKNOD \
--cap-add SYS_PTRACE \
--tmpfs /run \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--volume workspace_rust_plotly:/home/user/workspace_rust:rw \
--env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--group-add "$(getent group audio | cut -d: -f3)" \
--hostname debian_stock_two \
-p 2258:22 \
-p 5958:5900 \
debian_stage_next

# docker volumes
# docker volume create workspace_rust_five
# docker volume ls

# How to determine what containers use the docker volume?
# docker ps -a --filter volume=VOLUME_NAME_OR_MOUNT_POINT
# docker ps -a --filter volume=workspace_rust_plotly
# loop over volumes
# for v in $(docker volume ls --format "{{.Name}}")
# do
#  containers="$(docker ps -a --filter volume=$v --format '{{.Names}}' | tr '\n' ',')"
#  echo "volume $v is used by $containers"
# done


# clean all stopped conatainer
# docker rm -v $(docker ps --filter status=exited -q)

# docker inspect <container id>
# docker inspect 4afd7d8722be