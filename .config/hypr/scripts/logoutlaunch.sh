#!/bin/bash

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Paths
ScrDir=$(dirname "$(realpath "$0")")

wLayout="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/layout"
wlTmplt="${XDG_CONFIG_HOME:-$HOME/.config}/wlogout/style.css"

if [ ! -f "$wLayout" ] || [ ! -f "$wlTmplt" ]; then
    echo "ERROR: layout or style.css not found..."
    exit 1
fi


# Get current GTK theme & color scheme
gtkTheme=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")
gtkMode=$(gsettings get org.gnome.desktop.interface color-scheme | sed "s/'//g" | awk -F '-' '{print $2}')

# Get hyprland border radius & width
hypr_border=$(hyprctl -j getoption decoration:rounding | jq '.int')
hypr_width=$(hyprctl -j getoption general:border_size | jq '.int')


# Detect active monitor resolution and scale factor
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .scale' | sed 's/\.//')


# Scale layout
wlColms=6
export mgn=$(( y_mon * 28 / hypr_scale ))
export hvr=$(( y_mon * 23 / hypr_scale ))
export fntSize=$(( y_mon * 2 / 130 ))

# Set variables based on GTK dark/light mode
export BtnCol=$( [ "$gtkMode" == "dark" ] && echo "white" || echo "black" )
export WindBg=$( [ "$gtkMode" == "dark" ] && echo "rgba(0,0,0,0.5)" || echo "rgba(255,255,255,0.5)" )

# Border radius
export active_rad=$(( hypr_border * 5 ))
export button_rad=$(( hypr_border * 2 ))

# write all vars to style template 
wlStyle=$(envsubst < "$wlTmplt")

# Launch wlogout
wlogout -b "$wlColms" -c 0 -r 0 -m 0 \
    --layout "$wLayout" \
    --css <(echo "$wlStyle") \
    --protocol layer-shell