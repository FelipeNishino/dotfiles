#!/usr/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise kyou can use the nuclear option:
# killallj -q polybar

echo "---" | tee -a /tmp/polybar.log
#polybar 2>&1 | tee -a /tmp/polybar.log & disown
export MONITOR
export MODULES_R
BASE_MODULES="eth filesystem pulseaudio memory cpu date "

polybar --list-monitors | while read -r m
do
	MONITOR=$(echo $m | cut -d":" -f1)
	MODULES_R=$BASE_MODULES
    	echo $m | grep primary>/dev/null && MODULES_R="$MODULES_R tray"
   	polybar 2>&1 | tee -a /tmp/polybar.log & disown
done

echo "Bars launched..."
