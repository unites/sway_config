#!/bin/sh
timestamp=$(date +%m_%d_%y.%H:%M:%S)
grim -g "$(slurp)" -t png -o $HOME/Image/screenshots/ss.png