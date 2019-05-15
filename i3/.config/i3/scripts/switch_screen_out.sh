#!/bin/bash

OUT1="VGA-1"  # Monitor output, (mostly VGA) See 'xrandr-q'
OUT2="LVDS-1" # Output notebook screen (mostly LVDS), see 'xrandr-q'

# if output not connected exit
if xrandr | grep -i "$OUT1 disconnected ("; then  # if VGA is diconnected
	exit 1;
fi

# if we don't have a file, start at zero
if [ ! -f "$HOME/.config/i3/screen_status" ] ; then
	monitor_mode="all"

# otherwise read the value from the file
else
	monitor_mode=$(cat $HOME/.config/i3/screen_status)
fi

if [ $monitor_mode = "all" ]; then
	monitor_mode="EXTERNAL"
	xrandr --output $OUT2 --off --output $OUT1 --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $OUT2 --auto --output $OUT1 --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        #xrandr --output $OUT2 --auto --output $OUT1 --auto --same-as $OUT2
        xrandr --output $OUT2 --auto --output $OUT1 --auto
else
        monitor_mode="all"
        xrandr --output $OUT2 --auto --output $OUT1 --auto --left-of $OUT2
fi

echo "${monitor_mode}" > $HOME/.config/i3/screen_status
i3-msg restart
