[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

xsetroot -cursor_name left_ptr &

numlockx &

compton &

sxhkd &

xrandr --output DVI-D-0 --mode 1280x1024 --pos 1920x0 --rotate left --output HDMI-0 --off --output DVI-I-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-I-0 --off --output DP-1 --off --output DP-0 --off

redshift -l 35.4758:-79.1756 &

exec bspwm
