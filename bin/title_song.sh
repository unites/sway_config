#!/bin/sh


raw=`mpc status | head -2`


if [[ $raw =~ "volume:" ]];
then
	echo "None"
else
	echo $raw
fi
