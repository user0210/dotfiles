#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	IMG:${HOME}/.local/share/icons/generic/apps/scalable/web-browser-symbolic.svg		Browser			firefox
	IMG:${HOME}/.local/share/icons/generic/actions/scalable/sidebar-places-symbolic.svg	Filemanager		pcmanfm

Terminal (st)		st

Shutdown		poweroff
Reboot			reboot
EOF
