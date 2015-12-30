[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

xsetroot -cursor_name left_ptr &

numlockx &

compton -bz &

redshift -l 35.4758:-79.1756 &

sxhkd -f 30 &

exec bspwm
