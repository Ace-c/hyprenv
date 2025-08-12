#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]"
    exit 1
fi


execute_all_scripts() {
    local arg="$1"
    
    scripts=(
        "$HOME/.config/hypr/scripts/switch1.sh"
        "$HOME/.config/hypr/scripts/switch2.sh"
        "$HOME/.config/hypr/scripts/switch3.sh"
        "$HOME/.config/hypr/scripts/switch4.sh"
        "$HOME/.config/hypr/scripts/switch5.sh" 
    )

    for script in "${scripts[@]}"; do
        if [ -f "$script" ]; then
            echo "Executing $script $arg"
            bash "$script" "$arg"
        else
            echo "Warning: $script not found"
        fi
    done
}


case "$1" in
    -d|--dracula)
        execute_all_scripts "-d"
        ;;
    -g|--gruv)
        execute_all_scripts "-g"
        ;;
    -n|--nord)
        execute_all_scripts "-n"
        ;;
    -e|--everforest)
        execute_all_scripts "-e"
        ;;
    -b|--everblush)
        execute_all_scripts "-b"
        ;;
    *)
        echo "Invalid argument. Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush]"
        exit 1
        ;;
esac

echo "All theme changes have been applied."

