#!/bin/sh

mpd_cid=`pactl list clients short | grep mpd | awk '{print $1}'`
mpd_slist=`pactl list sink-inputs short`

if [[ $mpd_cid == `echo $mpd_slist | awk '{print $3}'` ]];
then
	echo "Success"
fi

echo $1

if [[ $1 =~ "up" ]];
then
	`pactl set-sink-volume $mpd_id +5%`
else
	`pactl set-sink-volume $mpd_id -5%`
fi

