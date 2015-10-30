[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

xsetroot -cursor_name left_ptr &

numlockx &

compton -bz &

# feh --bg-fill ~/Pictures/Wallpapers/citadel.jpg &
feh --bg-fill ~/Pictures/Wallpapers/redtrees-polyfy8.jpg

redshift -l 35.4758:-79.1756 &

sxhkd -f 30 &

exec bspwm
