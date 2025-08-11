#!/bin/bash

cd "$HOME" || exit 1

# QT Configuration files location
QT5CT_CONFIG="$HOME/.config/qt5ct/qt5ct.conf"
QT6CT_CONFIG="$HOME/.config/qt6ct/qt6ct.conf"

# Kvantum config files location
KVANTUM_THEME_DIR="$HOME/.config/Kvantum/themes"
KVANTUM_THEME_SYMLINK="$HOME/.config/Kvantum/kvantum.kvconfig"

# Function to change Qt5 Icons
change_qt5_icon() {
    local icon_theme="$1"
    sed -i "/^icon_theme=/c\icon_theme=${icon_theme}" "$QT5CT_CONFIG"
    echo "Changed icon theme to $icon_theme"
}

# Function to change Qt6 Icons
change_qt6_icon() {
    local icon_theme="$1"
    sed -i "/^icon_theme=/c\icon_theme=${icon_theme}" "$QT6CT_CONFIG"
    echo "Changed Qt6 icon theme to $icon_theme"
}

# Function to change the Kvantum theme
change_kvantum_theme() {
    local theme="$1"
    local theme_file="$KVANTUM_THEME_DIR/${theme}.kvconfig"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$KVANTUM_THEME_SYMLINK"
        echo "Symlink created for Kvantum: $theme_file -> $KVANTUM_THEME_SYMLINK"
        wait
    else
        echo "Error: Kvantum theme file $theme_file not found"
    fi
}

# Function to change all themes
change_all_themes() {
    local icon_theme="$1"
    local icon_theme="$2"
    local kvantum_theme="$3"
    
    change_qt5_icon "$icon_theme"
    change_qt6_icon "$icon_theme"
    change_kvantum_theme "$kvantum_theme"
    
    echo "All Qt theme changes have been applied."
}


case "$1" in
    -d|--dracula)
        change_all_themes "Newaita-reborn-dracula" "Newaita-reborn-dracula" "Dracula"
        ;;
    -g|--gruv)
        change_all_themes "gruvbox_dark" "gruvbox_dark" "Gruv"
        ;;
    -n|--nord)
        change_all_themes "Zafiro-Nord-Black" "Zafiro-Nord-Black" "Nord"
        ;;
    -e|--everforest)
        change_all_themes "Nordzy-turquoise-dark" "Nordzy-turquoise-dark" "Everforest"
        ;;
    -b|--everblush)
        change_all_themes "BeautyDream" "BeautyDream" "Everblush"
        ;;
    *)
        echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]" 
        exit 1
        ;;
esac