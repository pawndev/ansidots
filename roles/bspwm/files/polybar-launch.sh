#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar-secondary.log

# polybar example -r >>/tmp/polybar1.log 2>&1 & disown

MONITOR=$(polybar --list-monitors | grep primary | cut -d":" -f1) polybar primary -r >>/tmp/polybar1.log 2>&1 & disown
# Lauch a secondary bar without tray on all other monitors
for m in $(polybar --list-monitors | grep -v primary | cut -d":" -f1); do
    MONITOR=$m polybar secondary -r >>/tmp/polybar-secondary.log 2>&1 & disown
done
echo "Bars launched..."
