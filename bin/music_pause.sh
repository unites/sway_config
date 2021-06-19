#!/bin/bash

if [[ $(mpc status | grep playing) == 'playing' ]];
  then
    echo '  '
  else
    echo '  '
fi