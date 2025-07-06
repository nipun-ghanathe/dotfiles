#!/bin/bash

# Enables strict mode: exits on errors, unset vars, and pipeline failures.
set -euo pipefail

echo "=================================================="
echo " Debian Setup Script                              "
echo "=================================================="

cat <<EOF
Assumptions:
    - User is in the sudo group
    - Internet is accessible
    - Git is installed and dotfiles are at ~/dotfiles

Press ENTER to continue...
EOF
read -r

check_prereqs() {
  if ! groups "$USER" | grep -qw sudo; then
    echo "Error: User '$USER' is not in the sudo group."
    echo "Run: su -"
    echo "Then: usermod -aG sudo $USER && reboot"
    exit 1
  fi

  if [ ! -d "$HOME/dotfiles" ]; then
    echo "Dotfiles directory not found at ~/dotfiles. Exiting."
    exit 1
  fi
}

final_instructions() {
  echo
  echo "✅ Setup complete!"
  echo
  echo "❗Make sure you do other steps mentioned at https://github.com/nipun-ghanathe/dotfiles?tab=readme-ov-file#6-manual-setup-that-needs-to-be-done-post-setup"
}
