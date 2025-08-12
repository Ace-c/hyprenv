#!/bin/bash

SINK=$(pactl get-default-sink 2>/dev/null)
SOURCE=$(pactl get-default-source 2>/dev/null)

safe() { echo "$1" | iconv -f UTF-8 -t UTF-8//IGNORE 2>/dev/null || echo "Audio Device"; }

if [ "$1" = "up" ]; then
    current_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print $5}' | tr -d '%')
    if [ "$current_vol" -lt 100 ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print $5}' | tr -d '%')
        dunstify -h string:x-dunst-stack-tag:volume -h int:value:"$vol" -i audio-volume-high "Volume: ${vol}%" "$(safe "$SINK")" -r 9991 -t 1000
    else
        dunstify -h string:x-dunst-stack-tag:volume -h int:value:100 -i audio-volume-high "Volume: 100% (Max)" "$(safe "$SINK")" -r 9991 -t 1000
    fi

elif [ "$1" = "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print $5}' | tr -d '%')
    dunstify -h string:x-dunst-stack-tag:volume -h int:value:"$vol" -i audio-volume-high "Volume: ${vol}%" "$(safe "$SINK")" -r 9991 -t 1000

elif [ "$1" = "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
        dunstify -h string:x-dunst-stack-tag:volume -i audio-volume-muted "Output Muted" "$(safe "$SINK")" -r 9991 -t 1000
    else
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print $5}' | tr -d '%')
        dunstify -h string:x-dunst-stack-tag:volume -h int:value:"$vol" -i audio-volume-high "Volume: ${vol}%" "$(safe "$SINK")" -r 9991 -t 1000
    fi

elif [ "$1" = "micmute" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
        dunstify -h string:x-dunst-stack-tag:volume -i microphone-disabled "Microphone Muted" "$(safe "$SOURCE")" -r 9991 -t 1000
    else
        dunstify -h string:x-dunst-stack-tag:volume -i microphone-sensitivity-high "Microphone Unmuted" "$(safe "$SOURCE")" -r 9991 -t 1000
    fi

else
    echo "Usage: $0 {up|down|mute|micmute}"
    exit 1
fi