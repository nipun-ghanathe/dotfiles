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
choice=$(echo "$options" | wmenu -i -N "#282a36" -n "#f8f8f2" -S "#6272a4" -s "#f8f8f2" -M "#6272a4" -m "#f8f8f2" -p " ")

# Act based on the selected command
case "$choice" in
    'Power off') exec systemctl poweroff ;;
    Reboot) exec systemctl reboot ;;
    Lock) exec swaylock ;;
    Logout) exec swaymsg exit ;;
    Supend) exec swaylock && systemctl suspend ;;
    Hibernate) exec swaylock && systemctl hibernate ;;
esac
