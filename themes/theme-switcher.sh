#!/bin/bash
#
# theme-switcher.sh

# Make sure correct usage
[[ "$#" > 1 ]] && echo "Error: Usage: $0 [theme-name]" >&2 && exit 1

# Get the selected theme
if [[ -n "$1" ]]; then
  selected_theme="$1"
else
  selected_theme=$(find "$HOME/dotfiles/themes" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | rofi -dmenu -no-show-icons)
fi

# Make sure the theme is available
THEME_DIR="$HOME/dotfiles/themes/$selected_theme"
[[ -d "$THEME_DIR" ]] || echo "Error: Theme not available." >&2

# Link the current theme folder to the provided theme
ln -snf "$THEME_DIR" "$HOME/.config/theme"

# Change wallpaper
$HOME/dotfiles/.config/hypr/scripts/set-wallpaper.sh

# Reload apps

for kitty_pid in $(pgrep kitty); do
  kill -SIGUSR1 $kitty_pid
done

pkill waybar
waybar &

makoctl reload
