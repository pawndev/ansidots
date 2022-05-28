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
run nm-applet
run blueman-applet
setxkbmap us -option compose:ralt

# touchpad config
## two finger click context menu
xinput set-prop "DLL0945:00 04F3:311C Touchpad" "libinput Click Method Enabled" 0 1
## enable "reverse scrolling"
xinput set-prop "DLL0945:00 04F3:311C Touchpad" "libinput Natural Scrolling Enabled" 0
## Enable middle click with 3 fingers click
xinput set-prop "DLL0945:00 04F3:311C Touchpad" "libinput Scroll Method Enabled" 0 1
