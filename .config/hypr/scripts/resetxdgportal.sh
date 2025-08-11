#!/bin/bash

sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
