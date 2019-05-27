#!/bin/sh

bat_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep path|awk {'print $2'}|sed "s/(\|)//g")
if [[ $bat_status = "null" ]]; then echo -n "Battery Err" && exit 1; fi

bat_charge=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep percent|awk {'print $2'})
echo -n "$bat_charge "
if [[ $bat_charge = "100%" ]]; then exit 0; fi

power_status=$(upower -i /org/freedesktop/UPower/devices/line_power_AC|grep online|awk {'print $2'})

if [[ $power_status = "yes" ]]; then echo -n "(Charging)";
else echo -n "($(upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep time|awk {'print $4" "$5'}))"; fi
