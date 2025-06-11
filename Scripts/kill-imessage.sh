#!/bin/bash
# Monitor and kill Messages.app
while true; do
    if pgrep -x Messages > /dev/null; then
        pkill -x Messages
        logger "Messages.app was terminated by policy"
    fi
    sleep 1
done
