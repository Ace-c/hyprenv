#!/bin/bash

# Zathura theme dir 
ZATHURA_THEME_DIR="$HOME/.config/zathura/themes"
ZATHURA_SYMLINK_FILE="$HOME/.config/zathura/zathurarc"

# NvChad config file 
NVIM_CONFIG="$HOME/.config/nvim/lua/chadrc.lua"

# Cava themes files
CAVA_THEME_DIR="$HOME/.config/cava/themes"
CAVA_SYMLINK_FILE="$HOME/.config/cava/config"



# Function to change the Zathura theme
change_zathura_theme() {
    local theme="$1"
    local theme_file="$ZATHURA_THEME_DIR/${theme}"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$ZATHURA_SYMLINK_FILE"
        echo "change zathura theme to $theme"
    else
        echo "Error: zathura theme file $theme_file not found"
    fi
}

# Function to change the Neovim theme
change_neovim_theme() {
    local theme="$1"
    if [ -f "$NVIM_CONFIG" ]; then
        sed -i "s/theme = \"[^\"]*\"/theme = \"$theme\"/" "$NVIM_CONFIG"
        echo "Changed Neovim theme to $theme"
        
        # Reload highlights
        nvim --headless -c "lua require('base46').load_all_highlights()" -c q
        
        echo "Reloaded all highlights"
    else
        echo "Error: Neovim config file $NVIM_CONFIG not found"
    fi
}

# Function to change the Cava theme
change_cava_theme() {
    local theme="$1"
    local theme_file="$CAVA_THEME_DIR/${theme}"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$CAVA_SYMLINK_FILE"
        echo "change cava theme to $theme"
    else
        echo "Error: Cava theme file $theme_file not found"
    fi
}


# Function to change all themes
change_all_themes() {
    local zathura_theme="$1"
    local neovim_theme="$2"
    local cava_theme="$3"

    change_zathura_theme "$zathura_theme"
    change_neovim_theme "$neovim_theme"
    change_cava_theme "$cava_theme"

    sync
    echo "All theme changes have been applied and written to disk."
}



case "$1" in
    -d|--dracula)
        change_all_themes "dracula" "chadracula" "dracula" 
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruvbox" "gruv"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord" "nord"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest" "everforest" 
        ;;
    -b|--everblush)
        change_all_themes "everblush" "everblush" "everblush" 
        ;;
    *)
        echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]"
        exit 1
        ;;
esac

