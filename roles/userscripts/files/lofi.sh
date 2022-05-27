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
    printf "6. SmoothChill\n"
    printf "7. TSF Jazz\n"
    printf "8. Classic FM\n"
}

main() {
    choice=$(menu | rofi -dmenu | cut -d. -f1)
    case $choice in
    1)
        notification "Lofi Girl";
        mpv "https://www.youtube.com/watch?v=5qap5aO4i9A" --no-video
        break
        ;;
    2)
        notification "Chillhop";
        mpv "https://www.youtube.com/watch?v=5yx6BWlEVcY" --no-video
        break
        ;;
    3)
        notification "Box Lofi";
        mpv "http://stream.zeno.fm/f3wvbbqmdg8uv"
        break
        ;;
    4)
        notification "The Bootleg Boy";
        mpv "https://www.youtube.com/watch?v=vq3IvvNe7VY" --no-video
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
    7)
        notification "TSF Jazz";
        mpv "https://tsfjazz.ice.infomaniak.ch/tsfjazz-high.mp3"
        break
        ;;
    8)
        notification "Classic FM"
        mpv "https://media-ssl.musicradio.com/ClassicFM"
        break
        ;;
    esac
}

pkill -f mpv || main
# main