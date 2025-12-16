### Minimal Shell Configuration

# exports
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=xdg-open
export LANG=en_US.UTF-8
export PAGER="less -R"
export LESS="R"
# export PAGER="less -FRX"
# export LESS="FRX"

# paths
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/share/gem/ruby/3.3.0/bin" ]] && export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
. "$HOME/.cargo/env"

# nodejs (without loading nvm)
export NVM_DIR="$HOME/.nvm"
if [[ -d "$NVM_DIR/versions/node" ]]; then
  NODE_DEFAULT=$(ls -d "$NVM_DIR"/versions/node/* 2>/dev/null | sort -V | tail -n1)
  export PATH="$NODE_DEFAULT/bin:$PATH"
fi


# Launch Sway
if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  exec sway
fi
