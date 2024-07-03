#!/usr/bin/bash
export DISPLAY=:0
xhost +
vncviewer -Log "*:stderr:100" "$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(docker ps --format "{{.ID}}" | cut -d " " -f1)")"
