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

# Set keybindings
xmodmap ~/.Xmodmap

# Activate wallpaper
feh --bg-center ~/.wallpaper

 Run dwm
exec $HOME/.wm/bin/start${WM}
