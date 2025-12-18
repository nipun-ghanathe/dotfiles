#!/bin/bash
#
# 50-apps.sh : Install Apps

install_browser() {
  log "Installing Web Broser (Zen)..."

  if ! command -v gh >/dev/null 2>&1; then
    err "GitHub CLI is not installed. It is required for the automatic download of Obsidian."
  fi

  gh release download --repo zen-browser/desktop --pattern 'zen-x86_64.AppImage' --dir "$HOME/Downloads"

  if ! command -v ail-cli >/dev/null 2>&1; then
    err "ail-cli is not available. It is required for the automatic download of Zen. Install AppImageLauncher."
  fi

  ail-cli integrate "$HOME/Downloads/zen-x86_64.AppImage"
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
