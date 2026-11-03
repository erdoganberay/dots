#!/bin/sh
export PATH="$HOME/dots/scripts:$PATH"
dunst -conf /home/kindz/dots/dunst/dunstrc &
feh --bg-fill /home/kindz/dots/sadness.png &
picom --config /home/kindz/dots/picom/picom.conf &
dwmblocks &
exec dwm
