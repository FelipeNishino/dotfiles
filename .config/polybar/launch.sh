#!/usr/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise kyou can use the nuclear option:
# killallj -q polybar

echo "---" | tee -a /tmp/polybar.log
#polybar 2>&1 | tee -a /tmp/polybar.log & disown

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar 2>&1 | tee -a /tmp/polybar.log & disown
done

echo "Bars launched..."