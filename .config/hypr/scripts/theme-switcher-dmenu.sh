#!/bin/bash

selected=$(cat <<EOF | rofi -dmenu -no-show-icons
tokyonight
onedark
gruvbox
nord
dracula
catppuccin
rose-pine
EOF
)

"/home/nipun/dotfiles/.config/hypr/scripts/theme-switcher.sh" "$selected"
