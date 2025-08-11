#!/bin/bash

ScrDir=$(dirname "$(realpath "$0")")
roconf="$HOME/.config/rofi/config.rasi"


# Hyprland variables 
hypr_border=$(hyprctl -j getoption decoration:rounding | jq '.int')
hypr_width=$(hyprctl -j getoption general:border_size | jq '.int')

# GTK variables
gtk_font_size=$(gsettings get org.gnome.desktop.interface font-name | awk '{gsub(/'\''/,""); print $NF}')
gtk_icon_theme=$(gsettings get org.gnome.desktop.interface icon-theme | sed "s/'//g")

# Border radius override
wind_border=$(( hypr_border * 2 ))
elem_border=$([ "$hypr_border" -eq 0 ] && echo "10" || echo $(( hypr_border * 2 )))
r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"

# Font override
fnt_override="configuration {font: \"IBM Plex Sans Medium ${gtk_font_size}\";}"

# Icon theme override
icon_override="configuration {icon-theme: \"${gtk_icon_theme}\";}"


# Rofi actions
case $1 in
    d)  r_mode="drun" ;;
    f)  r_mode="filebrowser" ;;
    c)  r_mode="emoji -emoji-mode -copy" ;;
    h)  echo -e "rofilaunch.sh [action]\nwhere action,"
        echo "d :  drun mode"
        echo "f :  filebrowser mode"
        echo "c :  emoji mode"
        exit 0 ;;
    *)  r_mode="drun" ;;
esac


# Launch rofi
rofi -show $r_mode -theme-str "${fnt_override}" -theme-str "${r_override}" -theme-str "${icon_override}" -config "${roconf}"