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