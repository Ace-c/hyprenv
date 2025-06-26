#!/bin/bash
set -e
echo "copyig files..."

if [ -d ~/.config ]; then
    cp -r .config/* ~/.config/
else
    cp -r .config ~/
fi

tar -xf .icons/Icons.tar.zst -C .icons/
rm .icons/Icons.tar.zst

if [ -d ~/.icons ]; then
    cp -r .icons/* ~/.icons/
else
    cp -r .icons ~/
fi

tar -xf .themes/Themes.tar.zst -C .themes/
rm .themes/Theme.tar.zst

if [ -d ~/.themes ]; then
    cp -r .themes/* ~/.themes/
else
    cp -r .themes ~/
fi

if [ -d ~/.local/share/fonts ]; then
    cp -r fonts/* ~/.local/share/fonts/
else
    cp -r fonts ~/.local/share/
fi
# Update font cache
fc-cache -fv

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
cp .zshrc ~/
cp .gtkrc-2.0 ~/

# Check for oh-my-zsh & both pugins "zsh-autosuggenstions", "zsh-syntax-highlighting-git" are Installed or not
if ! command -v yay &>/dev/null; then
    echo "'yay' is not installed. Skipping oh-my-zsh plugin setup."
    echo "Please install yay first: https://aur.archlinux.org/packages/yay"
    exit 0
fi

if yay -Q oh-my-zsh-git &>/dev/null; then
    if yay -Q zsh-autosuggestions &>/dev/null; then
        sudo ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/
    fi

    if yay -Q zsh-syntax-highlighting-git &>/dev/null; then
        sudo ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins/
    fi
else
    echo "'oh-my-zsh-git' is not installed. Skipping plugin symlink setup."
fi

