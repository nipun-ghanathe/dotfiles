# source system profile file
[[ -f "/etc/profile" ]] && source "/etc/profile"

# exports
source "$HOME/.config/shell/exports.shell"

# paths
source "$HOME/.config/zsh/paths.zsh"

# Launch Sway
if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  exec dbus-run-session sway
fi
