#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	IMG:${HOME}/.xfiles/icons/web-browser-symbolic.png		Browser			firefox
	IMG:${HOME}/.xfiles/icons/sidebar-places-symbolic.png	Filemanager		pcmanfm

Terminal (st)		st

Shutdown		poweroff
Reboot			reboot
EOF
