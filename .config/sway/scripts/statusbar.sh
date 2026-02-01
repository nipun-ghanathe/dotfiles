#!/usr/bin/env bash
#
# statusbar.sh

# vim: sw=4 ts=4 sts=4

while true; do
    segments=()

    # volume
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null |
        awk '{ print ($3 == "[MUTED]" ? "muted" : int($2 * 100) "%") }')
    segments+=("VOL $volume")

    # network
    network=$(nmcli -t -f DEVICE,TYPE,STATE,CONNECTION device status 2>/dev/null |
        awk -F: '
            ($3 == "connected") {
                if ($2 == "wifi") { print $4; exit }
                else if ($2 == "ethernet") { print $1; exit }
            }
        ')
    segments+=("NET ${network:-offline}")

    # battery
    if [[ -r /sys/class/power_supply/BAT0/capacity ]]; then
        segments+=("BAT $(< /sys/class/power_supply/BAT0/capacity)%")
    fi

    # clock
    segments+=("$(date '+%A %Y-%m-%d %H:%M')")

    # print the whole thing
    printf '%s\n' "${segments[@]}" |
    awk '
    NR==1 {out = $0; next}
    {out = out " | " $0}
    END {print out}
    '

    sleep 1
done
