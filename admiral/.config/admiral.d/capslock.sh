#!/usr/bin/env bash

COLOR_URGENT_FG='#FFBF4700'
capslockcounter=0

sleep 1

while true; do
	capslockstatus=$(xset -q | awk 'NR == 4 {print $4}')
	if [[ $capslockstatus == on ]]; then
		case $capslockcounter in
			[0-4])
				echo "%{B$COLOR_URGENT_FG} Capslock On %{B-}"
				((capslockcounter++))
				;;
			[5-9]|10)
				echo "%{B-} Capslock On %{B-}"
				((capslockcounter++))
				;;
			*)
				echo "%{B$COLOR_URGENT_FG} Capslock On %{B-}"
				capslockcounter=0
				;;
		esac
	else
		echo ""
	fi
	sleep 0.1
done
