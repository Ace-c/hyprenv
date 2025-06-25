#!/bin/bash

if [ -d ~/.config ]; then
    cp -r .config/* ~/.config/
else
    cp -r .config ~/
fi

if [ -d ~/.icons ]; then
    cp -r .icons/* ~/.icons/
else
    cp -r .icons ~/
fi

if [ -d ~/.themes ]; then
    cp -r .themes/* ~/.themes/
else
    cp -r .themes ~/
fi

if [ -d ~/.local/share/fonts ]; then
    cp -r fonts/* ~/.local/share/fonts/
else
    mkdir -p ~/.local/share/fonts
    cp -r fonts/* ~/.local/share/fonts/
fi

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
cp .zshrc ~/
cp .gtkrc-2.0 ~/

