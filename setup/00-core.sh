#!/bin/bash
#
# 00-core.sh : Logging functions and preinstall setup

log() {
  echo -e "\e[1;34m[INFO]\e[0m $*"
}

err() {
  echo -e "\e[1;31m[ERROR]\e[0m $*" >&2
  exit 1
}

preinstall_setup() {
  log "Installing tools required for further setup: curl, wget, stow, git"
  sudo apt update && sudo apt install -y curl wget stow git

  log "Cloning the dotfiles repo and cd into it"
  git clone "https://github.com/nipun-ghanathe/dotfiles" "$HOME/dotfiles"
  cd "$HOME/dotfiles"
}

