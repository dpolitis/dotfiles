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

if xrandr | grep -i "$OUT1 connected ("; then  # if VGA is connected but disabled
	#echo "Enable external monitor"
	xrandr --output $OUT1 --auto --output $OUT2 --off # External monitor on/notebook screen off
        monitor_mode="EXTERNAL"
else
	#echo "Disable external monitor"
	xrandr --output $OUT2 --auto --output $OUT1 --off # Notebook screen/external monitor off
	monitor_mode="INTERNAL"
fi

echo "${monitor_mode}" > $HOME/.config/i3/screen_status
i3-msg restart
