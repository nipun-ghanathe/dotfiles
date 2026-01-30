#!/bin/bash

selected=$(cat <<EOF | rofi -dmenu -no-show-icons
Power off
Reboot
Lock
Log out
Suspend
Hibernate
EOF
)

case "$selected" in
  "Power off") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  # "Lock") pidof hyprlock || hyprlock ;;
  "Lock") loginctl lock-session ;;
  "Log out") hyprctl dispatch exit ;;
  "Suspend") systemctl suspend ;;
  "Hibernate") systemctl hibernate ;;
esac
