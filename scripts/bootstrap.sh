#!/bin/bash

launch_xvfb() {
    # Set defaults if the user did not specify envs.
    export DISPLAY=${XVFB_DISPLAY:-:1}
    local screen=${XVFB_SCREEN:-0}
    # local resolution=${XVFB_RESOLUTION:-1280x1024x24}
    # EIZO 
    local resolution=${XVFB_RESOLUTION:-1920x1080x24}
    local timeout=${XVFB_TIMEOUT:-5}

    # Start and wait for either Xvfb to be fully up,
    # or we hit the timeout.
    Xvfb "${DISPLAY}" -screen "${screen}" "${resolution}" &
    local loopCount=0
    until xdpyinfo -display "${DISPLAY}" > /dev/null 2>&1
    do
        loopCount=$((loopCount+1))
        sleep 1
        if [ ${loopCount} -gt "${timeout}" ]
        then
            echo "[ERROR] xvfb failed to start."
            exit 1
        fi
    done
}

launch_window_manager() {
    export DISPLAY=:1
    xrdb "$HOME"/.Xresources
    xsetroot -solid grey
    x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
    x-window-manager &
    # Fix to make GNOME work
    export XKL_XMODMAP_DISABLE=1
    #/etc/X11/Xsession
    startlxde &
}

run_vnc_server() {
    export DISPLAY=:1
    local passwordArgument='-nopw'

    if [ -n "${VNC_SERVER_PASSWORD}" ]
    then
        local passwordFilePath="${HOME}/x11vnc.pass"
        if ! x11vnc -storepasswd "${VNC_SERVER_PASSWORD}" "${passwordFilePath}"
        then
            echo "[ERROR] Failed to store x11vnc password."
            exit 1
        fi
        passwordArgument=-"-rfbauth ${passwordFilePath}"
        echo "[INFO] The VNC server will ask for a password."
    else
        echo "[WARN] The VNC server will NOT ask for a password."
    fi

    x11vnc -ncache 10 -display ${DISPLAY} -forever "${passwordArgument}"  &
    # x11vnc -xkb -display ${DISPLAY} -forever ${passwordArgument} &
    wait $!
}

install_xeyes(){
    # apt update
    # apt install --yes x11-apps
    export DISPLAY=:1
    xeyes &
}

launch_xvfb &
launch_window_manager &
run_vnc_server &
install_xeyes &