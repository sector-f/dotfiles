#!/usr/bin/env bash
# ~/.config/bspwm/panel/info.sh


# clickable area aliases
AC='%{A:'           # start click area
AB=':}'             # end click area cmd
AE='%{A}'           # end click area

. ~/.config/bspwm/panel/panel_colors

declare -f block
if [ $? = "1" ]; then
    function block() {
        [ ! -z $NoPadding ] && pPadding=$NoPadding
        if [ "$blockActive" = true ] ; then
            echo -n "%{B$pBGActiveTab}%{F$pBG}$(printf %${pPadding}s)$@$(printf %${pPadding}s)%{B$pBG} "
        else
            echo -n "%{B$pBGInactiveTab}%{F$pFG}$(printf %${pPadding}s)$@$(printf %${pPadding}s)%{B$pBG} "
        fi
    }
    export -f block
fi

startbutton() {
	echo "%{l} %{B${COLOR_BACKGROUND}}%{F#FFA3A6AB'}${AC}~/.config/bspwm/bin/menu${AB}$(echo -e "%{T2}\uf0c9%{T-}")${AE} "
}

icon() {
    echo -n -e "%{F$pIcon}\u$1 %{F$pFG}"
}

clock() {
    echo "%{B${COLOR_DARKRED}} $(date '+%I:%M %p') %{B-}"
}

volume() {
    display="$(icon f028) $(amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p')"
    command='xfce4-terminal -e "pavucontrol"'
    echo ${AC}$command${AB}$display${AE}
}

mpd() {
	cur_song=$(mpc current -f '%title%')
    #cur_song=$(basename "$(mpc current -f "%artist% - %title%")" | cut -c1-30 )

    #icon f001
    if [ -z "$cur_song" ]; then
        echo "%{B${COLOR_DARKRED}} MPD: Stopped %{B-}"
    else
        paused=$(mpc | grep paused)
        [ -z "$paused" ] && toggle="${AC}mpc pause${AB}$(icon f04c)${AE}" ||
            toggle="${AC}mpc play${AB}$(icon f04b)${AE}"
        prev="${AC}mpc prev${AB}$(icon f049)${AE}"
        next="${AC}mpc next${AB}$(icon f050)${AE}"
        cur_song="$cur_song"
        echo "%{B${COLOR_DARKRED}} $cur_song  $prev $toggle $next %{B-}"
    fi
}

pacmanupdates() {
    command="termite -e zsh -c 'sudo pacman -Syu' & sleep .1 && bspc window -t floating"
    echo "%{B${COLOR_DARKRED}} Updates: $(checkupdates | wc -l) %{B-}"
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

    [ -z "$*" ] && items="pacmanupdates mpd clock" \
                || items="$@"

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{+o}%{+u}$(block $($item))";
    done

    echo "$buf"

    buf="B"

    [ -z "$*" ] && items="startbutton" \
                || items="$@"

    for item in $items; do
        buf="${buf}%{U${COLOR_BACKGROUND}}%{-o}%{-u}$(block $($item))";
    done

    echo "$buf"

    sleep 1 # update interval
done
