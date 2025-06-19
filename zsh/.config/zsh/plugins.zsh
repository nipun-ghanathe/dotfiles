plug () {
  local short_url="$1"
  local plug_name="${short_url#*/}"

  PLUGINS_DIR="${PLUGINS_DIR:-$HOME/.config/zsh/plugins}"
  mkdir -p "$PLUGINS_DIR"

  if [[ ! -d "$PLUGINS_DIR/$plug_name" ]]; then
    echo "Installing $plug_name"
    git clone "https://github.com/$short_url" "$PLUGINS_DIR/$plug_name"
  fi

  source "$PLUGINS_DIR/$plug_name/$plug_name.zsh"
}

plug "zsh-users/zsh-autosuggestions"
