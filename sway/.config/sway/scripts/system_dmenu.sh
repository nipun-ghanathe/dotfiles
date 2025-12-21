#!/bin/bash

# List of options
options=$(cat <<EOF
Power off
Reboot
Lock
Logout
Suspend
Hibernate
EOF
)

# Use wmenu to display the menu
choice=$(echo "$options" | fuzzel --dmenu --lines 6 --width 10 --no-exit-on-keyboard-focus-loss --horizontal-pad 15 --anchor top-right --border-color 44475add)

# Act based on the selected command
case "$choice" in
    'Power off') exec systemctl poweroff ;;
    Reboot) exec systemctl reboot ;;
    Lock) exec swaylock ;;
    Logout) exec swaymsg exit ;;
    Suspend) systemctl suspend ;;
    Hibernate) systemctl hibernate ;;
esac
