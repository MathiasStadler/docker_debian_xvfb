# start_container_raspi_debian_xvfb.sh from command line

docker run -it \
-p 2222:22 \
-p 5959:5900 \
debian_lxde_xvfb bash


docker run -it \
-p 2222:22 \
-p 5959:5900 \
--hostname multi_stage \
debian_lxde_xvfb_multi_stage bash

docker run -it  -p 5900:5900 --hostname stage_r7 debian_stage_s7

docker run -it \
--security-opt apparmor=unconfined \
--cap-add SYS_ADMIN \
--cap-add CAP_SYSLOG \
--cap-add CAP_PERFMON \
--cap-add CAP_BPF \
--cap-add CAP_CHECKPOINT_RESTORE \
--tmpfs /run \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--device /dev/snd \
--device /dev/dri \
--volume /sys/fs/cgroup:/sys/fs/cgroup \
--volume /dev/shm:/dev/shm \
--volume /home/trapapa/docker_debian_12_ti/workspace:/home/user/workspace:rw \
--env PULSE_SERVER=unix:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume "${XDG_RUNTIME_DIR}"/pulse/native:"${XDG_RUNTIME_DIR}"/pulse/native \
--volume ~/.config/pulse/cookie:/root/.config/pulse/cookie \
--group-add "$(getent group audio | cut -d: -f3)" \
--hostname debian_stage_s7
debian_stage_s7