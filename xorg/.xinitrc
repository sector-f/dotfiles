[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

xsetroot -cursor_name left_ptr &

numlockx &

compton -bz &

feh --bg-fill ~/Pictures/Wallpapers/citadel.jpg &

redshift &

sxhkd -f 30 &

exec bspwm 
