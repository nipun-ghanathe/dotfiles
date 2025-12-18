#!/bin/bash
#
# 50-apps.sh : Install Apps

install_browser() {
  log "Installing Web Broser (Zen)..."
  curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | sh
}

install_obsidian() {
  log "Installing Obsidian..."
  
  if ! command -v gh >/dev/null 2>&1; then
    err "GitHub CLI is not installed. It is required for the automatic download of Obsidian."
  fi

  gh release download --repo "obsidianmd/obsidian-releases" --pattern 'obsidian*amd64.deb' --dir "$HOME/Downloads"
  sudo dpkg -i $HOME/Downloads/obsidian*amd64.deb
  rm $HOME/Downloads/obsidian*amd64.deb
}

install_apps() {
  install_browser
  install_obsidian
}
