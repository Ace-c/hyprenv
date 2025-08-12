#!/bin/bash

# Directory containing the color theme files for Waybar
WAYBAR_COLOR_DIR="$HOME/.config/waybar/colors"
WAYBAR_COLORS_SYMLINK="$HOME/.config/waybar/colors.css"

# Rofi theme files
ROFI_THEME_DIR="$HOME/.config/rofi/themes"
ROFI_THEME_SYMLINK="$HOME/.config/rofi/themes/theme.rasi"

#Wlogout theme files
WLOGOUT_THEME_DIR="$HOME/.config/wlogout/colors"
WLOGOUT_THEME_SYMLINK="$HOME/.config/wlogout/colors/theme.css"

# Dunst config file
DUNST_CONFIG_FILE="$HOME/.config/dunst/dunstrc"
DUNST_THEME_DIR="$HOME/.config/dunst/themes"


# Function to change VS Code theme
change_vscode_theme() {
    local theme="$1"
    local settings_file="$HOME/.config/Code/User/settings.json"
    local new_theme=""

    case "$theme" in
        "dracula")
            new_theme="Dracula Clean"
            ;;
        "gruv")
            new_theme="Gruvbox Dark Medium"
            ;;
        "nord")
            new_theme="OneNord"
            ;;
        "everforest")
            new_theme="Everforest Dark"
            ;;
        "everblush")
            new_theme="GitHub Dark"
            ;;
    esac

    if [ -f "$settings_file" ]; then
        sed -i "s/\"workbench.colorTheme\": \"[^\"]*\"/\"workbench.colorTheme\": \"$new_theme\"/" "$settings_file"
        echo "Changed VS Code theme to $new_theme"
    else
        echo "Error: VS Code settings file not found"
    fi
}

# Function to change the Waybar theme
change_waybar_theme() {
    local theme="$1"
    local theme_file="$WAYBAR_COLOR_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$WAYBAR_COLORS_SYMLINK"
        echo "Changed Waybar theme to $theme"
        killall -SIGUSR2 waybar
    
    else
        echo "Error: Waybar theme file $theme_file not found"
    fi
}


# Function to change the Rofi theme
change_rofi_theme() {
    local theme="$1"
    local theme_file="$ROFI_THEME_DIR/${theme}.rasi"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$ROFI_THEME_SYMLINK"
        echo "Changed Rofi theme to $theme"
        pkill -x rofi
    else
        echo "Error: Rofi theme file $theme_file not found"
    fi
}


# Function to change the wlogout theme
change_wlogout_theme() {
    local theme="$1"
    local theme_file="$WLOGOUT_THEME_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$WLOGOUT_THEME_SYMLINK"
        echo "Changed wlogout theme to $theme"
    else
        echo "Error: wlogout theme file $theme_file not found"
    fi
}


# Function to change the Dunst theme
change_dunst_theme() {
    local theme="$1"
    local theme_file="$DUNST_THEME_DIR/$theme"
    if [ -f "$DUNST_CONFIG_FILE" ] && [ -f "$theme_file" ]; then
        sed -i '75,$d' "$DUNST_CONFIG_FILE"
        cat "$theme_file" >> "$DUNST_CONFIG_FILE"
        echo "Changed Dunst theme to $theme"
        killall dunst
        dunst &
    else
        echo "Error: Dunst config file or theme file not found"
    fi
}



# Function to change all themes
change_all_themes() {
    local vscode_theme="$1"
    local waybar_theme="$2"
    local rofi_theme="$3"
    local wlogout_theme="$4"
    local dunst_theme="$5"

    change_vscode_theme "$vscode_theme"
    change_waybar_theme "$waybar_theme"
    change_rofi_theme "$rofi_theme"
    change_wlogout_theme "$wlogout_theme"
    change_dunst_theme "$dunst_theme"

    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -d|--dracula)
        change_all_themes "dracula" "dracula" "dracula" "dracula" "dracula"
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruv" "gruv" "gruv" "gruv"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord" "nord"  "nord" "nord"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest" "everforest" "everforest" "everforest" 
        ;;
    -b|--everblush)
        change_all_themes "everblush" "everblush" "everblush" "everblush" "everblush"
        ;;
    *)
        echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]"
        exit 1
        ;;
esac
