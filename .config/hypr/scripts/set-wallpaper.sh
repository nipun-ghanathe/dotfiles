#!/bin/bash

pkill swaybg

WALLPAPER=$(find "$HOME/.config/theme/backgrounds" -type f | shuf -n 1)

swaybg -i "$WALLPAPER" -m fill
