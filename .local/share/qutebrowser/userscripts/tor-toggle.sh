#!/bin/sh

if [ 'active' = "$(systemctl is-active tor)" ]; then
    pkexec systemctl stop tor
    echo "message-info 'Stopped Tor'" >  $QUTE_FIFO
    echo 'config-cycle -p content.proxy system system' > $QUTE_FIFO
else
    pkexec systemctl start tor
    echo "message-info 'Tor is running'" > $QUTE_FIFO
    # launch in the future (non-blocking)
    /bin/sh -c "sleep 0.2 ; echo 'config-cycle -p content.proxy socks://localhost:9050/ socks://localhost:9050/' >"$QUTE_FIFO
fi
