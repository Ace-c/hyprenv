#!/usr/bin/env bash

# Check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

aur=$(yay -Qua | wc -l)
ofc=`checkupdates | wc -l`


# Total updates 
upd=$((ofc + aur))
upd_formatted=$(printf "%02d" "$upd")


label="${upd_formatted} upd."


if [ "$upd" -eq 0 ]; then
    echo "{\"text\":\"$label\", \"tooltip\":\"Packages are up to date\"}"
else
    echo "{\"text\":\"$label\", \"tooltip\":\"Official: $ofc\nAUR: $aur\"}"
fi