#!/bin/bash

# Setting some variables
term=kitty

# List of options
options=$(cat <<EOF
ranger
clock-rs
stopwatch
timer90m
timer45m
timer25m
timer10m
timer5m
EOF
)

# Use wmenu to display the menu
choice=$(echo "$options" | wmenu -i -N "#282a36" -n "#f8f8f2" -S "#6272a4" -s "#f8f8f2" -M "#6272a4" -m "#f8f8f2" -p " ")

# Act based on the selected command
case "$choice" in
    ranger) exec ~/.local/bin/ranger-launch;;
    clock-rs) exec $term -e ~/.cargo/bin/clock-rs;;
    stopwatch) exec $term -e ~/.cargo/bin/clock-rs stopwatch;;
    timer90m) exec $term -e ~/.cargo/bin/clock-rs timer 5400;;
    timer45m) exec $term -e ~/.cargo/bin/clock-rs timer 2700;;
    timer25m) exec $term -e ~/.cargo/bin/clock-rs timer 1500;;
    timer10m) exec $term -e ~/.cargo/bin/clock-rs timer 600;;
    timer5m) exec $term -e ~/.cargo/bin/clock-rs timer 300;;
esac
