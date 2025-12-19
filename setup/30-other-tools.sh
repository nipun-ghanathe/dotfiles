#!/bin/bash
#
# 30-other-tools.sh : Install and setup other tools

install_kanata() {
  log "Installing and setting up Kanata..."
  cargo install kanata
  stow --verbose kanata

  sudo groupadd -f uinput
  sudo usermod -aG input,uinput "$USER"

  sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static-node=uinput"
EOF

  sudo udevadm control --reload-rules && sudo udevadm trigger
  sudo modprobe uinput
}

install_rclone() {
  log "Installing rclone and creating a boilerplate config..."
  sudo -v ; curl https://rclone.org/install.sh | sudo bash
  cp "$HOME/dotfiles/rclone/rclone.conf" "$HOME/.config/rclone/rclone.conf"
}

install_appimagelauncher() {
  log "Installing AppImageLauncher..."

  url=$(curl -s https://api.github.com/repos/TheAssassin/AppImageLauncher/releases/latest \
    | jq -r '.assets[]
        | select(.name | test("appimagelauncher.*_amd64\\.deb"))
        | .browser_download_url')
  curl -L -o "$HOME/Downloads/$(basename "$url")" "$url"
  sudo dpkg -i $HOME/Downloads/appimagelauncher*_amd64.deb
  rm $HOME/Downloads/appimagelauncher*_amd64.deb
}

install_other_tools() {
  install_kanata
  install_rclone
  install_appimagelauncher
}

