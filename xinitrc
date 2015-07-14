#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set default configurations
: ${WM:="dwm"}

# Activate wallpaper
feh --bg-center ~/.wallpaper

# Disable touchpad
#synclient TouchpadOff=1

setxkbmap -option "ctrl:nocaps"

# Load Xresources
xrdb -merge ~/.Xresources

# Run dwm
exec $HOME/bin/start${WM}

