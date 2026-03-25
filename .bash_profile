# exports
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=xdg-open
export PAGER="less -FR"
export LESS="FR"

# paths
add_to_path() {
	case ":$PATH:" in
		*":$1:") ;;
		*) [[ -d "$1" ]] && PATH="$1:$PATH" ;;
	esac
}
add_to_path "$HOME/bin"
add_to_path "$HOME/.local/bin"
export PNPM_HOME="$HOME/.local/share/pnpm"
add_to_path "$PNPM_HOME"
export PATH

# source .bashrc
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Launch Sway
if [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
	exec dbus-run-session sway
fi
