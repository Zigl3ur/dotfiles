#!/bin/bash


STATUS=$(nmcli radio wifi)

if [ "$STATUS" == "enabled" ]; then
    if nmcli radio wifi off; then
        notify-send --app-name="Network Manager" "Network" "Wi-Fi disabled successfully."
    else
        notify-send --app-name="Network Manager" "Network" "Failed to disable Wi-Fi."
    fi
elif [ "$STATUS" == "disabled" ]; then
    if nmcli radio wifi on; then
        notify-send --app-name="Network Manager" "Network" "Wi-Fi enabled successfully."
    else
        notify-send --app-name="Network Manager" "Network" "Failed to enable Wi-Fi."
    fi
fi