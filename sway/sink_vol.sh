#!/bin/sh

# Run this:
# pacmd list-sink-inputs | tr '\n' '\r' |perl -pe 's/ *index: ([0-9]+).+?application\.name = "([^\r]+)"\r.+?(?=index:|$)/\2:\1\r/g' | tr '\r' '\n' | grep "${1}"
# 3 sink input(s) available.
# Music Player Daemon:14
# Google Chrome:27
# Microsoft Edge:35

sink=$(pacmd list-sink-inputs | tr '\n' '\r' |perl -pe 's/ *index: ([0-9]+).+?application\.name = "([^\r]+)"\r.+?(?=index:|$)/\2:\1\r/g' | tr '\r' '\n' | grep "${1}")
selected=$(echo $sink | sed 's/^.*://g')

if [[ "$2" = "up" ]];
then
	pactl set-sink-input-volume $selected +1%
elif [[ "$2" = "down" ]];
then
	pactl set-sink-input-volume $selected -1%
elif [[ "$2" = "mute" ]];
then
	pactl set-sink-input-mute $selected toggle
fi