#!/bin/bash

pkill swaybg

# WALLPAPER_DIR="$HOME/dotfiles/wallpapers"
WALLPAPER_DIR="$HOME/dotfiles/wallpapers/nord"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

swaybg --image "$WALLPAPER" --mode fill
