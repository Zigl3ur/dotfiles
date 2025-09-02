#!/bin/bash

notif_count=$(swaync-client -c)
notif_disabled=$(swaync-client -D)

ENABLED=󰂞
ENABLED_COUNT=󱅫
DISABLED=󰂛

if [ $notif_disabled != "true" ]; then
  if [ $notif_count -gt 0 ]; then
    echo "$ENABLED_COUNT  $notif_count"
  else
    echo "$ENABLED"
  fi
else
  echo "$DISABLED"
fi
