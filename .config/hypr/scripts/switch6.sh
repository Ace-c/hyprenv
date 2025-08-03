#!/bin/bash

# zsh theme file
ZSH_THEME_FILE="$HOME/.zshrc"

# btop configuration file 
BTOP_CONFIG_FILE="$HOME/.config/btop/btop.conf"

# Kitty theme files
KITTY_THEME_DIR="$HOME/.config/kitty/themes"
KITTY_THEME_SYMLINK="$HOME/.config/kitty/themes/theme.conf"

# Hyprlock config files
HYPRLOCK_THEME_DIR="$HOME/.config/hypr/hyprlock-themes"
HYPRLOCK_THEME_SYMLINK="$HOME/.config/hypr/hyprlock.conf"

# Function to change the Zsh-theme
change_zsh_theme() {
    local theme_name="$1"
    sed -i "s|^source ~/.config/zsh-theme/.*\.zsh-theme|source ~/.config/zsh-theme/${theme_name}.zsh-theme|" "$ZSH_THEME_FILE"
    echo "Changed Zsh theme to $theme_name"
}

# Function to change the btop theme
change_btop_theme() {
    local theme_name="$1"
    sed -i "s|^color_theme *= *.*|color_theme = \"/usr/share/btop/themes/${theme_name}.theme\"|" "$BTOP_CONFIG_FILE"
    echo "Changed btop theme to $theme_name"
}

# Function to change the Kitty theme
change_kitty_theme() {
    local theme="$1"
    local theme_file="$KITTY_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$KITTY_THEME_SYMLINK"
        echo "Changed Kitty theme to $theme"
        killall -SIGUSR2 kitty
    else
        echo "Error: Kitty theme file $theme_file not found"
    fi
}

# Function to change the Hyprlock theme
change_hyprlock_theme() {
    local theme="$1"
    local theme_file="$HYPRLOCK_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$HYPRLOCK_THEME_SYMLINK"
        echo "Changed Hyprlock theme to $theme"
    else
        echo "Error: Hyprlock theme file $theme_file not found"
    fi
}

# Function to change all themes
change_all_themes() {
    local zsh_theme="$1"
    local btop_theme="$2"
    local kitty_theme="$3"
    local hyprlock_theme="$4"

    change_zsh_theme "$zsh_theme"
    change_btop_theme "$btop_theme"
    change_kitty_theme "$kitty_theme"
    change_hyprlock_theme "$hyprlock_theme"

    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -d|--dracula)
        change_all_themes "dracula" "dracula" "Dracula" "dracula"
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruvbox_dark_v2" "Gruv" "gruv"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord" "Nord" "nord"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest-dark-medium" "Everforest" "everforest"
        ;;
    -b|--everblush)
        change_all_themes "everblush" "adapta" "Everblush" "everblush"
        ;;
    *)
        echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]"
        exit 1
        ;;
esac
