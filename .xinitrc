#!/bin/sh
#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__
# /_/\_\_|_| |_|_|\__|_|  \___|
# 

# fix for QT (and dconf-editor)...
export QT_QPA_PLATFORMTHEME=qt5ct
#export DESKTOP_SESSION=gnome		#or set to xfce for classic ui
#export XDG_CURRENT_DESKTOP=GNOME	#or set to XFCE for classic ui

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.4

xset r rate 200 60

##### merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

##### start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##### i did this (x230 setting and window manager)
xrandr --dpi 125.37 &

exec dwm-starter
#exec dwm \
#-nbg "#1d2021" \
#-nfg "#d5c4a1" \
#-nbo "#504945" \
#-nfl "#504945" \
#-sbg "#83a598" \
#-sfg "#fbf1c7" \
#-sbo "#83a598" \
#-sfl "#83a598" \
#-ibg "#3c3836" \
#-ifg "#d5c4a1" \
#-ibo "#1d2021" \
#-abg "#665c54" \
#-afg "#ebdbb2" \
#-abo "#1d2021" \
#-dnb "#1d2021" \
#-dnf "#d5c4a1" \
#-dsb "#83a598" \
#-dsf "#fbf1c7" \
#2> ~/.config/dwm/dwm.log
## No error logging
## dwm >/dev/null 2>&1
