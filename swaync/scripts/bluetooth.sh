#!/bin/bash

STATUS=$(bluetooth)

if [ "$STATUS" == "bluetooth = on" ]; then
    if bluetooth off; then
        notify-send --app-name="Bluetooth Manager" "Bluetooth" "Bluetooth disabled successfully."
    else
        notify-send --app-name="Bluetooth Manager" "Bluetooth" "Failed to disable Bluetooth."
    fi
elif [ "$STATUS" == "bluetooth = off (software)" ]; then
    if bluetooth on; then
        notify-send --app-name="Bluetooth Manager" "Bluetooth" "Bluetooth enabled successfully."
    else
        notify-send --app-name="Bluetooth Manager" "Bluetooth" "Failed to enable Bluetooth."
    fi
fi