#!/bin/bash

(youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 0 $QUTE_URL && 
    notify-send "mp3 download completed!" "$QUTE_TITLE") || (notify-send -u critical "mp3 download failed!" && exit 0)
