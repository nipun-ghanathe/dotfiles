#!/bin/bash
#
# 40-desktop.sh : Setup the Desktop Environment with a Window Manager

install_wm() {
  log "Installing and setting up SwayWM..."
  sudo apt install -y sway
  find "$HOME/dotfiles/sway/.config/sway/scripts" -type f -exec chmod +x {} +
  stow --verbose sway
}

install_desktop_utilities() {
  log "Setting up things for Locking the computer..."
  sudo apt install -y swayidle swaylock
  stow --verbose swaylock

  log "Installing and setting up Waybar..."
  sudo apt install -y waybar
  stow --verbose waybar

  log "Installing and setting up Fuzzel..."
  sudo apt install -y fuzzel
  stow --verbose fuzzel

  log "Installing utilities for Audio and Brightness control..."
  sudo apt install -y pavucontrol brightnessctl

  log "Installing utilities for Clipboard Management..."
  sudo apt install -y wl-clipboard cliphist

  log "Installing utilities for Scrennshots..."
  sudo apt install -y grim slurp swappy

  log "Installing and setting up utilities for Notifications..."
  sudo apt install -y libnotify-bin mako-notifier
  stow --verbose mako

  log "Installing GUI File Manager..."
  sudo apt install -y pcmanfm
}

setup_theme() {
  log "Setting up GTK Theme..."
  gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
  gsettings set org.gnome.desktop.wm.preferences theme Adwaita-dark
}

setup_fonts() {
  log "Setting up Fonts..."
  stow --verbose fonts
  sudo apt install -y fonts-indic
}

setup_desktop() {
  install_wm
  install_desktop_utilities
  setup_theme
  setup_fonts
}

