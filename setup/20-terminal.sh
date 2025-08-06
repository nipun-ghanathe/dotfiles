#!/bin/bash
#
# 20-terminal.sh : Setup terminal environment

install_git() {
  log "Installing and setting up git..."
  sudo apt install -y git
  stow --verbose git

  log "Installing GitHub CLI..."
  (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

install_neovim() {
  log "Installing and setting up Neovim"
  if [[ ! -d "$HOME/builds/neovim/" ]]; then
    mkdir -p "$HOME/builds"
    git clone "https://github.com/neovim/neovim" "$HOME/builds/neovim"
  fi
  cd "$HOME/builds/neovim"
  git switch master
  git pull
  git fetch --tags
  git checkout stable
  make clean
  rm -rfv build .deps
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  git switch -
  cd "$HOME/dotfiles" && stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
}

setup_editor() {
  log "Installing and setting up things for the editor..."

  log "Installing pyright, ruff, mypy, djlint, ..."
  uv tool install pyright
  uv tool install ruff
  stow --verbose ruff
  uv tool install mypy
  stow --verbose mypy
  uv tool install djlint

  log "Installing lua-language-server..."
  mkdir -p "$HOME/builds"
  rm -rfv "$HOME/builds/lua-language-server"
  git clone "https://github.com/LuaLS/lua-language-server" "$HOME/builds/lua-language-server"
  cd "$HOME/builds/lua-language-server" && ./make.sh
  cd "$HOME/dotfiles"

  log "Installing stylua..."
  cargo install stylua
  stow --verbose stylua

  log "Installing typescript-language-server and prettier..."
  npm install -g typescript typescript-language-server
  npm install -g prettier

  log "Installing language servers for HTML, CSS, JS..."
  npm install -g vscode-langservers-extracted
  
  log "Installing live-server for live-reloading of HTML files..."
  npm install -g live-server

  log "Installing formatter for Markdown..."
  uv tool install --with mdformat-gfm mdformat 
}

install_tmux() {
  log "Installing and setting up Tmux and tmuxp..."
  sudo apt install -y tmux
  stow --verbose tmux
  uv tool install tmuxp
  stow --verbose tmuxp
}

setup_shell() {
  log "Setting up bash and profile..."
  rm $HOME/.bashrc $HOME/.profile
  stow --verbose bash profile

  log "Installing and setting up zsh..."
  sudo apt install -y zsh
  stow --verbose zsh
  chsh -s "$(which zsh)"
}

install_kitty() {
  log "Installing and setting up Kitty..."
  sudo apt install -y kitty
  stow --verbose kitty
  sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
}

setup_scripts() {
  log "Setting up personal scripts..."
  find "$HOME/dotfiles/scripts/.local/bin" -type f -exec chmod +x {} +
  mkdir -p "$HOME/.local/bin"
  stow --verbose scripts
}

install_other_cli_tools() {
  log "Installing better alternatives to the coreutils..."
  sudo apt install -y eza zoxide bat ripgrep fd-find htop
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"

  log "Installing some other helpful CLI tools..."
  sudo apt install -y ranger
  npm install -g tldr
}

setup_terminal() {
  install_git
  install_neovim
  setup_editor
  install_tmux
  setup_shell
  install_kitty
  setup_scripts
  install_other_cli_tools
}

