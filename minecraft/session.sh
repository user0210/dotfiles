#!/bin/bash

basedir=/home/ubuntu/minecraft
command='java -Xmx3G -Xms3G -jar server.jar nogui'

start() {
    echo "Starting server..."
    bash -c "tmux new-session -d -c $basedir -s minecraft $command"
    echo "Server started"

## better through systemd-service...
#    echo "Connect to Remote Server..."
#    sleep 60
#    ssh -nNT -R 2222:localhost:22 root@217.160.214.90 &
#    sleep 5
#    ssh -nNT -R 25565:localhost:25565 root@217.160.214.90 &
#    pid=$!
#    echo "Remote Server connected"
}

stop() {
    echo "Stopping SSH-tunnel..."
    kill $pid
    echo "SSH-tunnel stopped"
    echo "Stopping server..."
    tmux send-keys -t minecraft "stop" C-m
    echo "Server stopped"
}

case "$1" in
start)
    start
;;
stop)
    stop
;;
attach)
    tmux attach -t minecraft
;;
restart)
    stop
    sleep 0.8
    # wget -q -O /home/pi/minecraft/paperclip.jar https://papermc.io/api/v1/paper/1.16.2/latest/download
    # sleep 0.8
    sudo /sbin/reboot
;;
*)
echo "Usage: start.sh (start|stop|restart|attach)"
;;
esac
