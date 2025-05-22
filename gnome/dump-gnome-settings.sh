#!/bin/bash
echo "Dumping your gnome-settings..."
dconf dump /org/gnome/ > ~/dotfiles/gnome/gnome-settings.dconf
