#!/bin/sh

notification(){
    # notify-send "Now Playing: Lofi Radio ☕️🎶"
    notify-send -i "audio-speakers" "Now Playing: $1 ☕️🎶"
}

menu(){
    printf "1. Lofi Girl\n"
    printf "2. Chillhop\n"
    printf "3. Box Lofi\n"
    printf "4. The Bootleg Boy\n"
    printf "5. Radio Spinner\n"
    printf "6. SmoothChill"
}

main() {
    choice=$(menu | rofi -dmenu | cut -d. -f1)
    case $choice in
    1)
        notification "Lofi Girl";
        mpv "https://play.streamafrica.net/lofiradio"
        break
        ;;
    2)
        notification "Chillhop";
        mpv "http://stream.zeno.fm/fyn8eh3h5f8uv"
        break
        ;;
    3)
        notification "Box Lofi";
        mpv "http://stream.zeno.fm/f3wvbbqmdg8uv"
        break
        ;;
    4)
        notification "The Bootleg Boy";
        mpv "http://stream.zeno.fm/0r0xa792kwzuv"
        break
        ;;
    5)
        notification "Radio Spinner";
        mpv "https://live.radiospinner.com/lofi-hip-hop-64"
        break
        ;;
    6)
        notification "SmoothChill";
        mpv "https://media-ssl.musicradio.com/SmoothChill"
        break
        ;;
    esac
}

pkill -f mpv || main
# main