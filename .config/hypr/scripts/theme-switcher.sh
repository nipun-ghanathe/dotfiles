#!/bin/bash

theme_name="$1"

# neovim
echo "$theme_name" > "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/theme.txt"

# foot
if [[ -f "$HOME/dotfiles/.config/foot/themes/${theme_name}.ini" ]]; then
  echo "include=~/dotfiles/.config/foot/themes/${theme_name}.ini" > "$HOME/dotfiles/.config/foot/themes/default.ini"
fi
