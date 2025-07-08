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
  sudo apt install -y neovim
  stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
}

setup_editor() {
  log "Installing and setting up things for the editor..."
  stow --verbose ruff mypy
}

install_tmux() {
  log "Installing and setting up Tmux..."
  sudo apt install -y tmux
  stow --verbose tmux
}

setup_shell() {
  log "Setting up bash and profile..."
  rm ~/.bashrc ~/.profile
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

