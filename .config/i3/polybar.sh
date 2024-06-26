#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
killall -q picom

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.25; done

# Launch polybar
polybar &
picom &
