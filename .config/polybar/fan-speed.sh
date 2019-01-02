#!/bin/sh

speed1=$(sensors | grep fan1 | sed 's/fan[0-9]:\s*\(\w\{1,4\}\).*$/\1/')
speed2=$(sensors | grep fan2 | sed 's/fan[0-9]:\s*\(\w\{1,4\}\).*$/\1/')
speed3=$(sensors | grep fan3 | sed 's/fan[0-9]:\s*\(\w\{1,4\}\).*$/\1/')
speed4=$(sensors | grep fan4 | sed 's/fan[0-9]:\s*\(\w\{1,4\}\).*$/\1/')

if [ "$speed1" != "" ]; then
    echo "# $speed1 $speed2 $speed3 $speed4"
else
   echo "# "
fi
