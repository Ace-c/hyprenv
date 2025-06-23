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

if [ -d ~/.local/share ]; then
    cp -r fonts ~/.local/share/
else
    mkdir -p ~/.local/share
    cp -r fonts ~/.local/share/
fi

cp .gtkrc-2.0 ~/
cp .zshrc ~/
