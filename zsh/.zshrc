# load the minimal config only, if ZSH_CONFIG="minimal"
if [[ "$ZSH_CONFIG" == "minimal" ]]; then
  . "$HOME/.config/zsh/minimal.zsh"
  return
fi

# zinit - zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load user configuration files
. "$HOME/.config/zsh/minimal.zsh"
. "$HOME/.config/zsh/general.zsh"
. "$HOME/.config/zsh/exports.zsh"
. "$HOME/.config/zsh/aliases.zsh"
. "$HOME/.config/zsh/functions.zsh"
. "$HOME/.config/zsh/prompt.zsh"
