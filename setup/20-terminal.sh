#!/bin/bash
#
# 20-terminal.sh : Setup terminal environment

setup_shell() {
  log "Setting up bash..."
  [[ -f "$HOME/.bashrc" ]] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  [[ -f "$HOME/.bash_profile" ]] && mv "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
  stow --verbose bash

  # reload current shell environment using our rc file if current shell is bash
  [[ "${SHELL##*/}" = "bash" ]] && source "$HOME/.bash_profile" && source "$HOME/.bashrc"

  log "Installing and setting up zsh..."
  [[ -f "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
  [[ -f "$HOME/.zprofile" ]] && mv "$HOME/.zprofile" "$HOME/.zprofile.bak"
  sudo apt install -y zsh
  stow --verbose zsh
  chsh -s "$(which zsh)"

  # reload current shell environment using our rc file if current shell is zsh
  [[ "${SHELL##*/}" = "zsh" ]] && source "$HOME/.zprofile" && source "$HOME/.zshrc"
}

install_git() {
  log "Setting up git..."
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
  log "Installing and setting up Vim..."
  sudo apt install -y vim
  stow --verbose vimrc

  log "Installing and setting up Neovim..."
  sudo apt install -y neovim
  cd "$HOME/dotfiles" && stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
}

install_neovide() {
  log "Installing and setting up Neovide..."
  cargo install --git https://github.com/neovide/neovide
  stow --verbose neovide
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
  git clone "https://github.com/LuaLS/lua-language-server" "$HOME/builds/lua-language-server"
  cd "$HOME/builds/lua-language-server" && ./make.sh
  cd "$HOME/dotfiles"

  log "Installing stylua..."
  cargo install stylua
  stow --verbose stylua

  log "Installing typescript-language-server..."
  npm install -g typescript typescript-language-server

  log "Installing prettier..."
  npm install -g prettier

  log "Installing language servers for HTML, CSS, JS..."
  npm install -g vscode-langservers-extracted
  
  log "Installing live-server for live-reloading of HTML files..."
  npm install -g live-server

  log "Installing formatter for Markdown..."
  uv tool install --with mdformat-gfm mdformat 
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
  log "Installing some CLI tools..."
  sudo apt install -y tree eza zoxide bat ripgrep fd-find fzf htop ranger
  stow --verbose fzf
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  uv tool install tldr
}

setup_terminal() {
  install_git
  install_neovim
  setup_editor
  setup_shell
  install_kitty
  setup_scripts
  install_other_cli_tools
}

