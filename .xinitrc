#!/bin/sh
source $HOME/.bashrc
xrandr --output DVI-I-2 --right-of DVI-I-1
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
#ck-launch-session nm-applet --disable-sm &
gvolwheel&

eval `ssh-agent`
(
  ssh-add
  sshfs bigworm:/var/www/html/clients $HOME/mnt/clients
)&

exec awesome

