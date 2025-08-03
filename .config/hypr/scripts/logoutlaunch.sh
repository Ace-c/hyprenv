#!/bin/bash

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Set variables
ScrDir=$(dirname "$(realpath "$0")")
source "$ScrDir/themectl.sh"

wLayout="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/layout"
wlTmplt="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/style.css"

if [ ! -f "$wLayout" ] || [ ! -f "$wlTmplt" ]; then
    echo "ERROR: layout or style.css not found..."
    exit 1
fi

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .scale' | sed 's/\.//')

# Scale layout
wlColms=6

export mgn=$(( y_mon * 28 / hypr_scale ))
export hvr=$(( y_mon * 23 / hypr_scale ))
export fntSize=$(( y_mon * 2 / 130 ))

# detect gtk thme
export BtnCol=$( [ "$gtkMode" == "dark" ] && echo "white" || echo "black" )
export WindBg=$( [ "$gtkMode" == "dark" ] && echo "rgba(0,0,0,0.5)" || echo "rgba(255,255,255,0.5)" )

# check border radius
export active_rad=$(( hypr_border * 5 ))
export button_rad=$(( hypr_border * 8 ))

# write changes to config
wlStyle=$(envsubst < "$wlTmplt")

# Sir, you can lauch now
wlogout -b "$wlColms" -c 0 -r 0 -m 0 --layout "$wLayout" --css <(echo "$wlStyle") --protocol layer-shell