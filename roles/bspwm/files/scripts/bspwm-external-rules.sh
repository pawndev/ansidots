#!/bin/sh

wid=$1
class=$2
instance=$3
consequences=$4
name=$(xwininfo -id "$wid" | sed ' /^xwininfo/!d ; s,.*"\(.*\)".*,\1,')

rules=()

SCREEN_WIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1 | head -n 1)
SCREEN_HEIGHT=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -n 1)
WIDTH=$(echo $(( (${SCREEN_WIDTH}/4)*3)) | cut -f1 -d".")
HEIGHT=$(echo $(( (${SCREEN_HEIGHT}/4)*3)) | cut -f1 -d".")

main() {
    echo "" > /tmp/boulou.txt
    echo "WID: $wid" >> /tmp/boulou.txt
    echo "class: $class" >> /tmp/boulou.txt
    echo "instance: $instance" >> /tmp/boulou.txt
    echo "name: $name" >> /tmp/boulou.txt
    case "$class" in
        [Pp]hototonic)
            rules+=( "state=floating center=on rectangle=${WIDTH}x${HEIGHT}+0+0" )
            ;;
        Alacritty)
            [[ $instance == "alacrittyvpn" ]] && rules+=( "state=floating center=on rectangle=${WIDTH}x${HEIGHT}+0+0" )
            ;;
        TelegramDesktop)
            # Always show the Media viewer on the focused desktop
            # Useful if Telegram is not on its default desktop
            [[ $name == "Media viewer" ]] && rules+=( "desktop=focused" )
            ;;
        1Password)
            [[ $name == "1Password" ]] && rules+=("state=floating center=on rectangle=${WIDTH}x${HEIGHT}+0+0")
            [[ $name == "Quick Access — 1Password" ]] && rules+=("state=floating center=on")
            ;;
        Yad)
            [[ $name == "yad-calendar" ]] && rules+=("state=floating")
            ;;
        "")
            sleep 0.5

            wm_class=($(xprop -id $wid | grep "WM_CLASS" | grep -Po '"\K[^,"]+'))

            class=${wm_class[-1]}

            [[ ${#wm_class[@]} == "2" ]] && instance=${wm_class[0]}

            [[ -n "$class" ]] && main
            ;;
    esac
    case "$name" in
        "Event Tester") # xev
            rules+=( "state = floating" )
            ;;
    esac
    echo "rules: $rules" >>/tmp/boulou.txt
    echo "$rules"
}

main