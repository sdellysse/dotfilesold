#!/bin/sh

source $HOME/.bashrc

# Set up fonts and defaults
( xset +fp /usr/share/fonts/local && xset fp rehash) &
xrdb -load < ~/.Xdefaults &

# User daemons
eval `ssh-agent`
unclutter &
urxvtd -q -o -f &
dropboxd &

if [ "blank-space" == $HOSTNAME ]; then
    burn it down pooki
elif [ "work-desktop" == $HOSTNAME ]; then
    xrandr --output DVI-I-1 --rotate left
    xrandr --output DVI-I-2 --right-of DVI-I-1
    exec awesome
elif [ "home-desktop" == $HOSTNAME ]; then
    urxvt &
    exec icewm
fi
