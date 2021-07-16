#!/bin/sh

dunstify -h string:x-canonical-private-synchronous:music "Music Player: `mpc status | head -2`" -t 4000 -i audio-headphones -h int:value:"`mpc status | head -2 | grep % | awk '{print $4}' | sed 's/^.*(//g' | sed 's/\%.$//g'`"