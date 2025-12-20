#!/bin/bash
#
# 10-lang.sh : Install programming languages

install_lang_c() {
  log "Installing C/C++ build tools..."
  sudo apt install -y build-essential cmake ninja-build
}

install_lang_rust() {
  log "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  $HOME/.cargo/bin/cargo install cargo-update
}

install_lang_python() {
  log "Installing Python and tools..."

  sudo apt install -y python3 python3-pip python3-venv

  curl -LsSf https://astral.sh/uv/install.sh | sh

  $HOME/.local/bin/uv tool install ipython
  mkdir -p $HOME/.ipython/profile_default/
  stow --verbose ipython

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
  install_lang_c
  install_lang_rust
  install_lang_python
  # install_lang_ruby
  install_lang_nodejs
}

