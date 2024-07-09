#!/usr/bin/bash -euxo
# export PULSE_SERVER=unix:/pulse/native
export PULSE_SERVER=unix:/run/user/1000/pulse/native
export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export XDG_RUNTIME_DIR=/run/user/1000
export HOME=/home/user
xhost +
# google-chrome-stable --no-sandbox --no-gpu --use-gl=desktop -ozone-plattform=wayland --disable-dev-shm-usage
# --disable-gpu --disable-software-rasterizer
google-chrome-stable --no-sandbox --no-gpu --use-gl=desktop -ozone-plattform=wayland --disable-dev-shm-usage --disable-gpu --disable-software-rasterizer --no-init