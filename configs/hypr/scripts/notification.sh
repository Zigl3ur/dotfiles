#!/bin/bash

notification_count=$(swaync-client -c)

if [ $notification_count -gt 1 ]; then
    echo "• $notification_count Notifications"
else if [ $notification_count -eq 1 ]; then
    echo "• $notification_count Notification"
else
    echo ""
fi
