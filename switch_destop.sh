#!/bin/sh

if [ -z $1 ]; then
    echo "USAGE: $0 <offset>"
    exit
fi
offset=$1
cur_desktop=$(wmctrl -d | grep \* | awk '{ print $1}')
max_desktop=$(expr 1 + $(wmctrl -d | tail -n 1 | awk '{ print $1}'))
cur_desktop=$(expr \( $cur_desktop + $offset \) % $max_desktop)
if [ $cur_desktop -lt 0 ]; then
    cur_desktop=$(expr $cur_desktop + $max_desktop)
fi
wmctrl -s $cur_desktop
