#!/bin/sh
source $HOME/.bashrc
if [ "work-desktop" == $HOSTNAME ]; then
    xrandr --output DVI-I-1 --rotate left
    xrandr --output DVI-I-2 --right-of DVI-I-1
fi
#common setup
#(
#  killall random_wallpapers >& /dev/null
#  random_wallpapers
#)&
(
  xset +fp /usr/share/fonts/local
  xset fp rehash
)&
unclutter &
urxvtd -q -o -f &
xrdb -load < ~/.Xdefaults &
dropboxd &
gvolwheel&

eval `ssh-agent`
(
  ssh-add
  sshfs bigworm:/var/www/html/clients $HOME/mnt/clients
)&

if [ "work-desktop" == $HOSTNAME ]; then
    exec awesome
else
    urxvt &
    exec icewm
fi
