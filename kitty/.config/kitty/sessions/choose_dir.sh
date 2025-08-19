#!/usr/bin/bash

# what are kittens
# is this a good use case for them???

source "$HOME/.config/fzf/fzf-config.sh"

work_dir="$({ echo $HOME; $HOME/.local/bin/fd . ~/code --type d; } | fzf)"

if [[ -z "$work_dir" ]]; then
  echo "Work dir not selected" >&2
  exit 0
fi

kitty \
  --session "$HOME/.config/kitty/sessions/default.session" \
  --directory "$work_dir" \
  --detach
