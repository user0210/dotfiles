#!/bin/bash

# externalpipe_buffer.sh: use with surf/st externalpipe-signal patches
#   Input Usage: echo st or surf content from externalpipe | ./externalpipe_buffer.sh {st,surf}_strings_read
#   Menus Usage: ./externalpipe_buffer.sh dmenu_{copy, type}

BUFFER_FILE=/tmp/content_buffer
function st_strings_read() {
  INPUT="$(cat)"
  echo "$(
    echo "$INPUT" | grep -Eo '\S+' | tr -d '[:blank:]'
    echo "$INPUT" | grep -oP '"[^"]+"' | tr -d '"'
    echo "$INPUT" | sed 's/^ *[0-9]\+.//g' | awk '{$1=$1};1'
  )" | uniq | grep . | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- \
  > $BUFFER_FILE &
}

function surf_strings_read() {
  awk '{printf "%sNEWLINE_REPLACE", $0} END {printf "\n"}' |
    xmllint --html --xpath "//*" - |
    awk '{ gsub("<[^>]*>", ""); print($0); }' |
    sed 's/NEWLINE_REPLACE/â†µ/g' |
    awk '{ gsub("<[^>]*>",""); print $0 }' |
    sed 's/&lt;/</g' |
    sed 's/&gt;/>/g' |
    uniq | grep . | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- \
    > $BUFFER_FILE &
}

function trigger_sigusr1() {
  USE_FIFO=T # Recomended as T but only if using dmenu-stdin patch w/ FIFO
  rm -f $BUFFER_FILE
  if [ $USE_FIFO == T ]; then mkfifo $BUFFER_FILE; else touch $BUFFER_FILE; fi
  pkill -USR1 "surf" &
  pkill -USR1 "^st$" &
  if [ $USE_FIFO != T ]; then sleep 0.8; fi
}

function dmenu_copy() {
  trigger_sigusr1
  setxkbmap de && cat $BUFFER_FILE | dmenu -l 10 -i -w $(xdotool getactivewindow) -p 'Screen Copy' | sed 's/â†µ/\n/g' | xclip -i -selection c
}

function dmenu_type() {
  trigger_sigusr1
#  setxkbmap de && stty -echo && \
#	  cat $BUFFER_FILE | grep '╰╼ ' | cut -d ' ' -f 4- | dmenu -l 10 -i -w $(xdotool getactivewindow) -p 'Screen Type' | \
#	  sed 's/â†µ/\n/g' | xargs -IC xdotool type --delay 0 "C" && \
#	  stty echo
 setxkbmap de && cat $BUFFER_FILE | dmenu -l 10 -i -w $(xdotool getactivewindow) -p 'Screen Type' | sed 's/â†µ/\n/g' | xargs -IC xdotool type --delay 0 "C"
}

function pipe_combine() {
  trigger_sigusr1
  cat - $BUFFER_FILE
}

$1
