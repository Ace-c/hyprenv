#!/bin/bash

set -x

lockFile="/tmp/wallpapers_$(id -u)_swwwallpaper.lock"

cleanup() {
    rm -f "$lockFile"
    echo "Script completed. Lock file removed."
}
trap cleanup EXIT

# Check for another swww instance
if [ -e "$lockFile" ]; then
    pid=$(cat "$lockFile")
    if [ -d "/proc/$pid" ]; then
        
        cmdline=$(tr '\0' ' ' < "/proc/$pid/cmdline")
        if [[ "$cmdline" == *swwwallpaper.sh* ]]; then
            echo "Error: Another instance of swwwallpaper.sh is already running (PID: $pid)."
            exit 1
        else
            echo "Warning: Stale lock file found for PID $pid. Removing..."
            rm -f "$lockFile"
        fi
    else
        echo "Info: Stale lock file found. Removing..."
        rm -f "$lockFile"
    fi
fi

echo $$ > "$lockFile"


Wall_Update() {
    local x_wall="$1"
    local theme_name="$2"
    local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/swww/$theme_name"
    
    mkdir -p "$cache_dir"
    local cacheImg=$(basename "$x_wall")

    if [ ! -f "${cache_dir}/${cacheImg}.thumb" ]; then
        magick "${x_wall}"[0] -strip -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_dir}/${cacheImg}.thumb" &
    fi

    if [ ! -f "${cache_dir}/${cacheImg}.rofi" ]; then
        magick "${x_wall}"[0] -strip -resize 2000 -gravity center -extent 2000 -quality 90 "${cache_dir}/${cacheImg}.rofi" &
    fi

    if [ ! -f "${cache_dir}/${cacheImg}.blur" ]; then
        magick "${x_wall}"[0] -strip -scale 10% -blur 0x3 -resize 100% "${cache_dir}/${cacheImg}.blur" &
    fi

    wait

    ln -fs "${x_wall}" "${XDG_CONFIG_HOME:-$HOME/.config}/swww/wall.set"
    ln -fs "${cache_dir}/${cacheImg}.rofi" "${XDG_CONFIG_HOME:-$HOME/.config}/swww/wall.rofi"
    ln -fs "${cache_dir}/${cacheImg}.blur" "${XDG_CONFIG_HOME:-$HOME/.config}/swww/wall.blur"
}

Wall_Change() {
    local x_switch=$1
    local current_wall=$(readlink "${XDG_CONFIG_HOME:-$HOME/.config}/swww/wall.set")
    local theme_name=$(basename "$(dirname "$current_wall")")
    local theme_dir="${XDG_CONFIG_HOME:-$HOME/.config}/swww/$theme_name"

    if [ ! -d "$theme_dir" ]; then
        echo "Error: theme directory '$theme_dir' not found."
        exit 1
    fi

    mapfile -d '' Wallist < <(find "$theme_dir" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | sort -z)

    local current_index=0
    for (( i=0; i<${#Wallist[@]}; i++ )); do
        if [ "${Wallist[i]}" == "${current_wall}" ]; then
            current_index=$i
            break
        fi
    done

    if [ "$x_switch" == "n" ]; then
        nextIndex=$(( (current_index + 1) % ${#Wallist[@]} ))
    elif [ "$x_switch" == "p" ]; then
        nextIndex=$(( (current_index - 1 + ${#Wallist[@]}) % ${#Wallist[@]} ))
    else
        echo "Invalid direction. Use 'n' for next or 'p' for previous."
        exit 1
    fi

    Wall_Update "${Wallist[nextIndex]}" "$theme_name"
}

Wall_Set() {
    local transition=${1:-grow}

    swww img "$(readlink "${XDG_CONFIG_HOME:-$HOME/.config}/swww/wall.set")" \
        --transition-bezier .43,1.19,1,.4 \
        --transition-type "$transition" \
        --transition-duration 0.7 \
        --transition-fps 60 \
        --invert-y \
        --transition-pos "$( hyprctl cursorpos )"
}

#  Check for swww-daemon
swww query || swww-daemon

# -n for next wall, -p for previous, -s for whatever you want to set with wall path
case "$1" in
    -n) Wall_Change "n" && Wall_Set ;;
    -p) Wall_Change "p" && Wall_Set ;;
    -s)
        if [ -f "$2" ]; then
            theme_name=$(basename "$(dirname "$2")")
            Wall_Update "$2" "$theme_name" && Wall_Set
        else
            echo "Error: Wallpaper file not found: $2"
            exit 1
        fi
        ;;
    *)
        Wall_Set
        ;;
esac