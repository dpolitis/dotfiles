#!/bin/bash
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x5 /tmp/screen_locked.png
#mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
convert /tmp/screen_locked.png -font "DejaVu-Sans-Bold" -pointsize 40 -fill "white" -stroke black -strokewidth 2 -gravity center -annotate +0+160 "Do not touch what is not yours" ~/.icons/lock.png -gravity center -composite /tmp/screen_locked.png
i3lock -i /tmp/screen_locked.png
