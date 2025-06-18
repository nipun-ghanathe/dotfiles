CONFIG_DIR="$HOME/.config/zsh"
PLUGINS_DIR="$CONFIG_DIR/plugins"

# Loading zsh-config files
source "$CONFIG_DIR/paths.zsh"
for file in $CONFIG_DIR/*.zsh; do
  source "$file"
done
