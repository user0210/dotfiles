#!/bin/bash

(youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" $QUTE_URL && 
    notify-send "download completed!" "$QUTE_TITLE") || (notify-send -u critical "download failed!" && exit 0)
