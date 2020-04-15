. /home/philipp/.zshrc

####################################################
##### tmux autostart
####################################################

#### atostart tmux with sessions in windows (arch-wiki)
SCRATCH=$(tmux ls 2> /dev/null | grep "scratchpad" | wc -l)
if [[ "$SCRATCH" == "0" ]]; then
    tmux new-session -s scratchpad 2> /dev/null
else
    if [[ -z "$TMUX" ]] ;then
    	ID="$( tmux ls 2> /dev/null | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    	if [[ "$ID" != "scratchpad" ]] ;then # if not available create a new one
    	    tmux new-session -d -t scratchpad
#    	    tmux new-session -d -t scratchpad -s scratchpad
#    	    tmux new-window
    	    tmux attach-session -t scratchpad \; set-option destroy-unattached
    	else
    	    tmux attach-session -t scratchpad
    	fi
    fi
fi
