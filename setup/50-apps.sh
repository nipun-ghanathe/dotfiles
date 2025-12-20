#!/bin/bash
#
# 50-apps.sh : Install Apps

install_browser() {
  log "Installing Web Broser (Zen)..."
  curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | sh
}

install_obsidian() {
  log "Installing Obsidian..."
  url=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest \
    | jq -r '.assets[]
        | select(.name | test("obsidian.*amd64\\.deb"))
        | .browser_download_url')
  debfile="$HOME/Downloads/$(basename "$url")"
  curl -L -o "$debfile" "$url"
  sudo dpkg -i "$debfile"
  rm "$debfile"
}

install_apps() {
  install_browser
  install_obsidian
}

