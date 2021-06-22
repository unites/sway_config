#!/bin/sh

# ﯎
# ﯏

# if [[ $(xset q dpms | grep 'DPMS\ is') =~ "Enabled" ]];
#   then
#     echo '﯏ '
#   else
#     echo '﯎ '
# fi


if [[ $(xset q | grep 'Standby') =~ "600" ]];
  then
    echo ' ﯏  '
  else
    echo ' ﯎  '
fi