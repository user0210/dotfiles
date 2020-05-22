. /home/philipp/.zshrc

####################################################
##### tmux autostart
####################################################

#### atostart tmux with sessions in windows (arch-wiki)
#STMUX=$(tmux ls 2> /dev/null | grep '^[0-9]\+:' | wc -l)
#if [[ "$STMUX" == "0" ]]; then
#    tmux new-session -d -t scratchpad -s 1
#    tmux attach-session -t 1 \; set-option destroy-unattached
#else
#    if [[ -z "$TMUX" ]] ;then
#    	ID="$( tmux ls 2> /dev/null | grep '^[0-9]\+:' | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
#    	if [[ -z "$ID" ]] ;then # if not available create a new one
#    	    ((STMUX++))
#    	    tmux new-session -d -t scratchpad -s $STMUX
#    	    tmux new-window
#    	    tmux attach-session -t $STMUX \; set-option destroy-unattached
#    	else
#    	    tmux attach-session -t "$ID" \; set-option destroy-unattached
#    	fi
#    fi
#fi


#### separate stmux-scratchpad
STMUX=$(tmux ls 2> /dev/null | grep '^[0-9]\+:' | wc -l)
if [[ "$STMUX" == "0" ]]; then
    tmux new-session -s 1 2> /dev/null
#   tmux new-session -s 1 \; set-option destroy-unattached 2> /dev/null
else
    if [[ -z "$TMUX" ]] ;then
    	ID="$( tmux ls 2> /dev/null | grep '^[0-9]\+:' | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    	if [[ -z "$ID" ]] ;then # if not available create a new one
    	    ((STMUX++))
    	    tmux new-session -d -t 1 -s $STMUX
    	    tmux new-window
    	    tmux attach-session -t $STMUX \; set-option destroy-unattached
    	else
    	    tmux attach-session -t $ID \; set-option destroy-unattached
    	fi
    fi
fi
