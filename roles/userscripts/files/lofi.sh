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
        title="Lofi Girl"
        notification "$title";
        mpv "https://www.youtube.com/watch?v=5qap5aO4i9A" --no-video --title="$title"
        break
        ;;
    2)
        title="Chillhop"
        notification "$title";
        mpv "https://www.youtube.com/watch?v=5yx6BWlEVcY" --no-video --title="$title"
        break
        ;;
    3)
        title="Box Lofi"
        notification "$title";
        mpv "http://stream.zeno.fm/f3wvbbqmdg8uv" --title="$title"
        break
        ;;
    4)
        title="The Bootleg Boy"
        notification "$title";
        mpv "https://www.youtube.com/watch?v=vq3IvvNe7VY" --no-video --title="$title"
        break
        ;;
    5)
        title="Radio Spinner"
        notification "$title";
        mpv "https://live.radiospinner.com/lofi-hip-hop-64" --title="$title"
        break
        ;;
    6)
        title="SmoothChill"
        notification "$title";
        mpv "https://media-ssl.musicradio.com/SmoothChill" --title="$title"
        break
        ;;
    7)
        title="TSF Jazz"
        notification "$title";
        mpv "https://tsfjazz.ice.infomaniak.ch/tsfjazz-high.mp3" --title="$title"
        break
        ;;
    8)
        title="Classic FM"
        notification "$title"
        mpv "https://media-ssl.musicradio.com/ClassicFM" --title="$title"
        break
        ;;
    esac
}

pkill -f mpv || main
# main