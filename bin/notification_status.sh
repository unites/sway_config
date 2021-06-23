#!/bin/sh


if [[ $(dunstctl is-paused) =~ "true" ]];
  then
    echo ' ﮡ  '
  else
    echo ' ﮠ  '
fi