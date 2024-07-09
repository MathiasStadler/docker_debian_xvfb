#!/bin/bash
export DISPLAY=:0
xhost +
vncviewer -Log "*:stderr:100"