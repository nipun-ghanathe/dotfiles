CONFIG_DIR="$HOME/.config/zsh"
PLUGINS_DIR="$CONFIG_DIR/plugins"

# Loading zsh-config files
for file in $CONFIG_DIR/*.zsh; do
  source "$file"
done

# Loading plugins
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# Plugins setup
bindkey '^ ' autosuggest-accept
