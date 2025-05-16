#!/bin/bash
echo "Loading gnome settings..."
dconf load /org/gnome/ < ~/dotfiles/gnome/gnome-settings.dconf
