#!/bin/bash
#
# 50-apps.sh : Install Apps

install_browser() {
  log "Installing Web Broser (Zen)..."
  curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | sh
}

install_apps() {
  install_browser
}

