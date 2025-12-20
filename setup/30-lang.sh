#!/bin/bash
#
# 10-lang.sh : Install programming languages

setup_shell() {
  log "Installing zsh and making it default shell..."
  sudo apt install -y zsh
  chsh -s "$(which zsh)"

  log "Setting up bash and zsh..."
  [[ -f "$HOME/.bashrc" ]] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  [[ -f "$HOME/.bash_profile" ]] && mv "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
  [[ -f "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
  [[ -f "$HOME/.zprofile" ]] && mv "$HOME/.zprofile" "$HOME/.zprofile.bak"
  stow --verbose shell
}

install_lang_c() {
  log "Installing C/C++ build tools..."
  sudo apt install -y build-essential cmake ninja-build
}

install_lang_rust() {
  log "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_lang_python() {
  log "Installing Python and tools..."

  sudo apt install -y python3 python3-pip python3-venv

  log "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh

  log "Installing IPython via uv..."
  $HOME/.local/bin/uv tool install ipython
  mkdir -p $HOME/.ipython/profile_default/
  stow --verbose ipython

  log "Installing Miniconda..."
  mkdir -p $HOME/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3/miniconda.sh
  bash $HOME/miniconda3/miniconda.sh -b -u -p $HOME/miniconda3
  rm $HOME/miniconda3/miniconda.sh
  stow --verbose conda
}

# install_lang_ruby() {
#   log "Installing Ruby..."
#   sudo apt install -y ruby-full
# }

install_lang_nodejs() {
  log "Installing Nodejs using nvm with npm..."

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install node
}

install_languages() {
  setup_shell
  install_lang_c
  install_lang_rust
  install_lang_python
  # install_lang_ruby
  install_lang_nodejs
}

