#!/bin/bash

players=("mopidy" "spotify")
players_icon=()

get_player_status() {
    playerctl -p $1 status
}

format_current_song() {
    playerctl -p $1 metadata --format "{{ artist }} - {{ title }}"
}

main() {
    has_break=1
    for t in ${players[@]}; do
        status=$(get_player_status $t  2>&1)
        if [[ "$status" == "Playing" ]]; then
            echo "$(format_current_song $t)"
            has_break = 0
            break;
        fi
    done
    if [[ $has_break == 1 ]]; then
        echo ""
    fi
}

main