#!/bin/bash


ROFI_THEME_FILE="$HOME/.config/rofi/themes/theme.rasi"

# fallback colors
MAIN_BG="#232a2eff"
MAIN_FG="#d3c6aaff"
SELECT_BG="#343f44ff"
SELECT_FG="#d3c6aaff"

if [ -f "$ROFI_THEME_FILE" ]; then
    MAIN_BG=$(awk -F: '/main-bg/{gsub(/[; ]/, "", $2); print $2}' "$ROFI_THEME_FILE")
    MAIN_FG=$(awk -F: '/main-fg/{gsub(/[; ]/, "", $2); print $2}' "$ROFI_THEME_FILE")
    SELECT_BG=$(awk -F: '/select-bg/{gsub(/[; ]/, "", $2); print $2}' "$ROFI_THEME_FILE")
    SELECT_FG=$(awk -F: '/select-fg/{gsub(/[; ]/, "", $2); print $2}' "$ROFI_THEME_FILE")
fi


ROFI_STYLE=$(cat <<EOF
* {
    font: "JetBrainsMono Nerd Font 12";
    background-color: ${MAIN_BG};
    text-color: ${MAIN_FG};
    border: 0;
    padding: 7px;
}

window {
    background-color: ${MAIN_BG};
    border-color: ${MAIN_BG};
    border-radius: 3px;
    padding: 100px;
    width: 700px;
}

mainbox, message, textbox, listview, entry, prompt, textbox-prompt-colon, rows {
    background-color: ${MAIN_BG};
    text-color: ${MAIN_FG};
}

element {
    background-color: ${MAIN_BG};
    text-color: ${MAIN_FG};
    border-radius: 0px;
    padding: 0px;
}

element-icon, element-text, textbox, dummy, rows, entry, message {
    background-color: ${MAIN_BG};
    text-color: ${MAIN_FG};
    
}

scrollbar {
    handle-width: 0px;
    border: 0;
    border-color: transparent;
    background-color: ${MAIN_BG};
}

element selected {
    background-color: ${SELECT_BG};
    text-color: ${SELECT_FG};
    border-radius: 0px;
}
EOF
)

# Keybinds text
KEYBINDS=$(cat <<EOF
──────────────────────────────────────────────
󰭟 Dracula           + 󰘶 + D
󱖊 Everblush         + 󰘶 + B
󱁕 Everforest        + 󰘶 + E
 Gruvbox           + 󰘶 + G
󱄆 Nord              + 󰘶 + N
──────────────────────────────────────────────
 Switch Workspace:      Ctrl + 󰘶 + ←/→
󰨙 Hide Waybar:           Ctrl + ESC
󰟡 Switch Waybar Style:     + Alt + ↑/↓
 Open Terminal:           + Return
 App Launcher:            + A
 Lock Screen              + L
󰨵 Screenshot Region        + PRNT
󰹑 Screenshot Screen       󰘶 + PRNT
──────────────────────────────────────────────
[ Press Esc to exit ]
EOF
)

# Launch with strict no-config fallback
echo "$KEYBINDS" | rofi -no-config -no-lazy-grab -dmenu -theme-str "$ROFI_STYLE" -p "󰌓 Keybinds"
