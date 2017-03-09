#!/bin/sh

while true
do
    RESULT=`pgrep feh_bg.sh`

    if [ "${RESULT:-null}" = null ]; then
        find ~/.i3/wallpapers -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
            shuf -n1 -z | xargs -0 feh --bg-max
        sleep 10s
    else
        echo "already running"
        break
    fi
done
