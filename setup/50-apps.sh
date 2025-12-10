#!/bin/bash
#
# 50-apps.sh : Install Apps

install_firefox() {
  log "Installing Firefox..."
  sudo install -d -m 0755 /etc/apt/keyrings
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
  gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
  echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla 
  sudo apt update && sudo apt install -y firefox
}

install_thunar() {
  log "Installing Thunar File Manager..."
  sudo apt install -y thunar
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

# install_todoist() {
#   log "Installing Todoist..."
#
#   if ! command -v ail-cli >/dev/null 2>&1; then
#     err "AppImageLauncher is not installed. 'ail-cli' command is not available. It is required for automatic installation of Todoist."
#   fi
#
#   wget -O "$HOME/Downloads/Todoist.AppImage" "https://todoist.com/linux_app/appimage"
#   ail-cli integrate "$HOME/Downloads/Todoist.AppImage"
# }

install_apps() {
  install_firefox
  install_thunar
  install_obsidian
  # install_todoist
}
