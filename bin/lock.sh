#!/bin/sh
exec xautolock -detectsleep -time 1 -locker "i3lock -t -i ~/Images/Hex.png" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
