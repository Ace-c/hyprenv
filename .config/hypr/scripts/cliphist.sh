#!/bin/bash

ScrDir=$(dirname "$(realpath "$0")")
roconf="$HOME/.config/rofi/clipboard.rasi"

# set position offsets
x_offset=-17 # from cursor position
y_offset=210   

# Get window size from clipboard layout config
clip_h=$(awk '/window {/,/}/ {if ($1 ~ /height:/) {print $2}}' "$HOME/.config/rofi/clipboard.rasi" | awk -F "%" '{print $1}')
clip_w=$(awk '/window {/,/}/ {if ($1 ~ /width:/) {print $2}}' "$HOME/.config/rofi/clipboard.rasi" | awk -F "%" '{print $1}')

# Monitor resolution
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
monitor_rot=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .transform')

# For rotated monitors
if [ "$monitor_rot" == "1" ] || [ "$monitor_rot" == "3" ]; then
    tempmon=$x_mon
    x_mon=$y_mon
    y_mon=$tempmon
fi

# Monitor scale
monitor_scale=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .scale' | sed 's/\.//')
x_mon=$((x_mon * 100 / monitor_scale))
y_mon=$((y_mon * 100 / monitor_scale))

# Monitor position
x_pos=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .x')
y_pos=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .y')

# Cursor position
x_cur=$(hyprctl -j cursorpos | jq '.x')
y_cur=$(hyprctl -j cursorpos | jq '.y')

# Ignore position
x_cur=$((x_cur - x_pos))
y_cur=$((y_cur - y_pos))

# Size limits
clip_w=$(( x_mon * clip_w / 100 ))
clip_h=$(( y_mon * clip_h / 100 ))
max_x=$((x_mon - clip_w - 5)) # offset of 5 for gaps
max_y=$((y_mon - clip_h - 15)) # offset of 15 for gaps

x_cur=$((x_cur - x_offset))
y_cur=$((y_cur - y_offset))
x_cur=$(( x_cur < min_x ? min_x : ( x_cur > max_x ? max_x :  x_cur) ))
y_cur=$(( y_cur < min_y ? min_y : ( y_cur > max_y ? max_y :  y_cur) ))

pos="window {location: north west; x-offset: ${x_cur}px; y-offset: ${y_cur}px;}"

# Get hyprland border + width
hypr_border=$(hyprctl -j getoption decoration:rounding | jq '.int')
hypr_width=$(hyprctl -j getoption general:border_size | jq '.int')

# Hyprland border styling
wind_border=$(( hypr_border * 5 / 2 ))
elem_border=$([ "$hypr_border" -eq 0 ] && echo "5" || echo "$hypr_border")
r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} entry {border-radius: ${elem_border}px;} element {border-radius: ${elem_border}px;}"

# Font override (GTK monospace font)
fnt_override=$(gsettings get org.gnome.desktop.interface monospace-font-name | awk '{gsub(/'\''/,""); print $NF}')
fnt_override="configuration {font: \"JetBrainsMono Nerd Font ${fnt_override}\";}"

# Actions
case $1 in
    c)  cliphist list | rofi -dmenu -theme-str "entry { placeholder: \"Copy...\";} ${pos} ${r_override}" -theme-str "${fnt_override}" -config "$roconf" | cliphist decode | wl-copy ;;
    d)  cliphist list | rofi -dmenu -theme-str "entry { placeholder: \"Delete...\";} ${pos} ${r_override}" -theme-str "${fnt_override}" -config "$roconf" | cliphist delete ;;
    w)  if [ "$(echo -e "Yes\nNo" | rofi -dmenu -theme-str "entry { placeholder: \"Clear Clipboard History?\";} ${pos} ${r_override}" -theme-str "${fnt_override}" -config "$roconf")" == "Yes" ]; then
            cliphist wipe
        fi ;;
    f)  cliphist list | wc -l ;;
    *)  echo "Usage: cliphist.sh [c|d|w|f]"
        echo "  c : copy from history"
        echo "  d : delete from history"
        echo "  w : wipe history"
        echo "  f : print history count, can be used as waybar module"
        exit 1 ;;
esac