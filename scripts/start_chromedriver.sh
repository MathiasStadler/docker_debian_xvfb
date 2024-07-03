#!/usr/bin/bash -euxo
export DISPLAY=:1
xhost +
/chromedriver/chromedriver-linux64/chromedriver --port=9515 --verbose