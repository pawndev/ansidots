#!/bin/sh

function run {
    if ! pgrep $1 > /dev/null;
    then
        $@&
    fi
}

~/.config/polybar/launch.sh &
run feh --bg-fill ~/Pictures/Wallpapers/ffxiv-endwalker.png
run sxhkd
run 1password --silent
