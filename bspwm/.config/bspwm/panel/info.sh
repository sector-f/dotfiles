#!/usr/bin/env bash
# ~/.config/bspwm/panel/info.sh


# clickable area aliases
AC='%{A:'           # start click area
AB=':}'             # end click area cmd
AE='%{A}'           # end click area
togglefile=/tmp/toggle

. ~/.config/bspwm/panel/panel_colors

# get updates every 5 minutes
while :; do
	checkupdates | wc -l > /tmp/.checklog
	sleep 300
done &

# Functions for items I want to display

# Launches a dzen2 menu with applications, things that were recently edited in neovim, and system shutdown options
startbutton() {
	echo "%{l}%{B${COLOR_BACKGROUND}} ${AC}~/.config/bspwm/bin/menu${AB}$(echo -e "%{T2}\uf0c9%{T-}")${AE}  %{B-}"
}

# Some function neeasade made to use the icon font; give the unicode number (e.g. f0c9) as an argument
icon() {
    echo -n -e "%{F$pIcon}%{T3}\u$1 %{T-}%{F$pFG}"
}

# Used to show/hide additional items
togglebutton() {
	if [[ -n $(grep showsysinfo=false $togglefile) ]]; then
		echo "%{A:sed -i 's/showsysinfo=false/showsysinfo=true/' $togglefile:}%{B${COLOR_BACKGROUND}}  %{B-}%{A}"
	elif [[ -n $(grep showsysinfo=true $togglefile) ]]; then
		echo -e "%{A:sed -i 's/showsysinfo=true/showsysinfo=false/' $togglefile:}%{B${COLOR_BACKGROUND}}  %{B-}%{A}"
	else
		echo "showsysinfo=false" >> $togglefile
	fi
}

# Flashing indicator when capslock is on; may be called "autistic" and "bloat" by some
capslock() {
	capslockstatus=$(xset -q | awk 'NR == 4 {print $4}')
	if [[ $capslockstatus == on ]]; then
		case $capslockcounter in
			[0-1])
				echo "%{B$COLOR_URGENT_FG} Capslock On %{B-}"
				((capslockcounter++))
				echo $capslockcounter
				;;
			[2-4])
				echo "%{B$COLOR_BACKGROUND} Capslock On %{B-}"
				((capslockcounter++))
				echo $capslockcounter
				;;
			*)
				echo "%{B$COLOR_URGENT_FG} Capslock On %{B-}"
				echo 0
				;;
		esac
	else
		echo ""
	fi
}

# I really hope I don't have to tell you what this is
clock() {
    echo "%{B${COLOR_HIGHLIGHT}}${AC}~/.config/bspwm/bin/dzen_calendar${AB} $(date '+%I:%M %p') ${AE}%{B-}"
}

# Stolen from neeasade; haven't really used it much. Might work on it eventually
volume() {
    display="$(icon f028) $(amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p')"
    command='xfce4-terminal -e "pavucontrol"'
    echo ${AC}$command${AB}$display${AE}
}

# If mpd is playing, this will tell you what song is playing, and give you prev/pause/play/next buttons
mpd() {
	cur_song=$(mpc current -f '%artist% - %title%')
	percentage=$(mpc | awk 'NR==2 {print $4}')
    #cur_song=$(basename "$(mpc current -f "%artist% - %title%")" | cut -c1-30 )

    #icon f001
    if [ -z "$cur_song" ]; then
        echo "%{B${COLOR_HIGHLIGHT2}} MPD: Stopped %{B-}"
    else
        paused=$(mpc | grep paused)
        [ -z "$paused" ] && toggle="${AC}mpc pause${AB}$(icon f04c)${AE}" ||
            # toggle="${AC}mpc play${AB}▶${AE}"
            toggle="${AC}mpc play${AB}$(icon f04b)${AE}"
        prev="${AC}mpc prev${AB}$(icon f049)${AE}"
        next="${AC}mpc next${AB}$(icon f050)${AE}"
        cur_song="$cur_song"
		percentage="$percentage"
        echo "%{B${COLOR_HIGHLIGHT2}} MPD: ${cur_song} ${percentage} $prev $toggle $next %{B-}"
    fi
}

# Tells you how out-of-date your precious "bleeding edge" computer is
pacmanupdates() {
	echo "%{B${COLOR_HIGHLIGHT2}} Updates: $(cat /tmp/.checklog) %{B-}"
}

# Set what items to display and where

while :; do
	capslockcounter="$(capslock | tail -n 1 )"

	# Left side items
    buf="S"

	# If we're showing less items
	if [[ -n $(grep showsysinfo=false $togglefile) ]]; then
		items="togglebutton capslock clock"
	else
	# If we're showing more items
		items="togglebutton mpd capslock clock"
	fi

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{-o}%{-u}$(echo $($item | head -n 1))";
    done

    echo "$buf"

	# Right side items
    buf="B"

	items="startbutton"

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{-o}%{-u}$(echo $($item | head -n 1))";
    done

    echo "$buf"

	# update interval
    sleep 0.2
done
