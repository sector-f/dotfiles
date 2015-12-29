#!/usr/bin/env bash
# Send notification on song change
while true; do
	currentsong="$(mpc current)"
	mpc idle > /dev/null
	[[ "$(mpc current)" != "$currentsong" ]] && notify-send "$(mpc current)"
done
