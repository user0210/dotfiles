. /home/philipp/.zshrc

####################################################
##### tmux autostart
####################################################

#### atostart tmux with sessions in windows (arch-wiki)
SCRATCH=$(tmux ls 2> /dev/null | grep "scratchpad" | wc -l)
STMUX=$(tmux ls 2> /dev/null | wc -l)
if [[ "$SCRATCH" != "0" ]]; then
    ((STMUX=STMUX-1))
fi
if [[ "$STMUX" == "0" ]]; then
    tmux new-session -s 1 2> /dev/null
else
    if [[ -z "$TMUX" ]] ;then
    	ID="$( tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    	if [[ -z "$ID" ]] ;then # if not available create a new one
    	    ((STMUX++))
    	    tmux new-session -d -t 1 -s $STMUX
    	    tmux new-window
    	    tmux attach-session -t $STMUX \; set-option destroy-unattached
    	else
    	    tmux attach-session -t "$ID"
    	fi
    fi
fi
