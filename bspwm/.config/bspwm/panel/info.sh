#!/usr/bin/env bash
# ~/.config/bspwm/panel/info.sh


# clickable area aliases
AC='%{A:'           # start click area
AB=':}'             # end click area cmd
AE='%{A}'           # end click area
togglefile=/tmp/toggle
# togglefile=~/.config/bspwm/panel/toggle

. ~/.config/bspwm/panel/panel_colors

# get updates every 5 minutes
while :; do
	checkupdates | wc -l > /tmp/.checklog
	sleep 300
done &

# declare -f block
# if [ $? = "1" ]; then
#     function block() {
#         [ ! -z $NoPadding ] && pPadding=$NoPadding
#         if [ "$blockActive" = true ] ; then
#             echo -n "%{B$pBGActiveTab}%{F$pBG}$(printf %${pPadding}s)$@$(printf %${pPadding}s)%{B$pBG} "
#         else
#             echo -n "%{B$pBGInactiveTab}%{F$pFG}$(printf %${pPadding}s)$@$(printf %${pPadding}s)%{B$pBG} "
#         fi
#     }
#     export -f block
# fi

startbutton() {
	echo "%{l}%{B${COLOR_BACKGROUND}} ${AC}~/.config/bspwm/bin/menu${AB}$(echo -e "%{T2}\uf0c9%{T-}")${AE}  %{B-}"
}

icon() {
    echo -n -e "%{F$pIcon}%{T3}\u$1 %{T-}%{F$pFG}"
}

togglebutton() {
	if [[ -n $(grep showsysinfo=false $togglefile) ]]; then
		echo "%{A:sed -i 's/showsysinfo=false/showsysinfo=true/' $togglefile:}%{B${COLOR_BACKGROUND}}  %{B-}%{A}"
	elif [[ -n $(grep showsysinfo=true $togglefile) ]]; then
		echo -e "%{A:sed -i 's/showsysinfo=true/showsysinfo=false/' $togglefile:}%{B${COLOR_BACKGROUND}}  %{B-}%{A}"
	else
		echo "showsysinfo=false" >> $togglefile
	fi
}

capslock() {
	if [[ -n $(xset -q | sed -n 's/\(on\|off\).*/\1/;4p' | grep on) ]]; then
		echo "%{B$COLOR_URGENT_FG} Capslock On %{B-}"
	else
		echo ""
	fi
}

clock() {
    echo "%{B${COLOR_HIGHLIGHT}} $(date '+%I:%M %p') %{B-}"
}

volume() {
    display="$(icon f028) $(amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p')"
    command='xfce4-terminal -e "pavucontrol"'
    echo ${AC}$command${AB}$display${AE}
}

mpd() {
	cur_song=$(mpc current -f '%artist% - %title%')
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
        echo "%{B${COLOR_HIGHLIGHT2}} MPD: ${cur_song} $prev $toggle $next %{A}%{B-}"
    fi
}

pacmanupdates() {
    command="termite -e zsh -c 'sudo pacman -Syu' & sleep .1 && bspc window -t floating"
	echo "%{B${COLOR_HIGHLIGHT2}} Updates: $(cat /tmp/.checklog) %{B-}"
}

#aurupdates () {
#	aurupdates=$(eval cower -u | wc -l)
#    command="urxvt -e zsh -c 'cower -u' & sleep .1 && bspc window -t floating"
#    echo ${AC}$command${AB}$(icon f062)AUR: $aurupdates${AE}
#}

#determine what to display based on arguments, unless there are none, then display all.
blockActive=false;
while :; do
    buf="S"

	if [[ -n $(grep false $togglefile) ]]; then
	[ -z "$*" ] && items="togglebutton capslock clock" \
                || items="$@";
	else
	[ -z "$*" ] && items="togglebutton mpd capslock clock" \
                || items="$@";
	fi

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{-o}%{-u}$(echo $($item))";
    done

    echo "$buf"

    buf="B"

    [ -z "$*" ] && items="startbutton" \
                || items="$@"

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{-o}%{-u}$(echo $($item))";
    done

    echo "$buf"

    sleep 0.5 # update interval
done
