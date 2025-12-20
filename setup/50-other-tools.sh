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
  mkdir -p "$HOME/.config/rclone"
  cp "$HOME/dotfiles/rclone/rclone.conf" "$HOME/.config/rclone/rclone.conf"
}

install_other_tools() {
  install_kanata
  install_rclone
}

