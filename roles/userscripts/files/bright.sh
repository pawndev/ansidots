#!/bin/bash
# changeBrightness

msgTag="mybright"

light "$@"

current_brightness="$(light -G | cut -d'.' -f1)"
dunstify -a "changeBrightness" -u low -i brightness -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$current_brightness" "Brightness: ${current_brightness}%"
