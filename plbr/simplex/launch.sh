#!/usr/bin/env bash
killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar left -c $HOME/.config/plbr/simplex/config.ini &
#polybar mid -c $HOME/.config/plbr/simplex/config.ini &
polybar right -c $HOME/.config/plbr/simplex/config.ini &
