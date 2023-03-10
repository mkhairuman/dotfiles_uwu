#!/bin/bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get network Interface
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Load on second monitor if connected
external_monitor=$(xrandr --query | grep 'HDMI1')
if [[ $external_monitor = HDMI1\ connected* ]]; then
	polybar -c ~/.config/plbr/everforest/config.ini secondary &
fi

## Load bar on primary monitor
polybar -c ~/.config/plbr/everforest/config.ini main &

