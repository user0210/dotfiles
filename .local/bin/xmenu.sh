#!/bin/sh

cat <<EOF | xmenu | sh &
Applications
	IMG:/home/philipp/.xfiles/icons/web-browser-symbolic.png		Browser			firefox
	IMG:/home/philipp/.xfiles/icons/sidebar-places-symbolic.png		Filemanager		pcmanfm

Terminal (st)		st

Shutdown		poweroff
Reboot			reboot
EOF
