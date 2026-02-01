#!/bin/bash

selected=$(cat <<EOF | wmenu -i -l 6
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
  "Lock") swaylock --daemonize ;;
  "Log out") swaymsg exit ;;
  "Suspend") systemctl suspend ;;
  "Hibernate") systemctl hibernate ;;
esac
