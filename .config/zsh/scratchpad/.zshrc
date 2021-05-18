. ~/.config/zsh/.zshrc

####################################################
##### tmux autostart
####################################################

#### atostart tmux with sessions in windows (arch-wiki)
SCRATCH=$(tmux ls 2> /dev/null | grep "scratchpad" | wc -l)
if [[ "$SCRATCH" == "0" ]]; then
    tmux new-session -d -s scratchpad 2> /dev/null
#   tmux new-session -s scratchpad \; set-option destroy-unattached 2> /dev/null
else
    if [[ -z "$TMUX" ]] ;then
    	ID="$( tmux ls 2> /dev/null | grep "scratchpad" | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    	if [[ "$ID" != "scratchpad" ]] ;then # if not available create a new one
    	    tmux new-session -d -t scratchpad
    	    tmux attach-session -t scratchpad
#    	    tmux attach-session -t scratchpad \; set-option destroy-unattached
    	else
    	    tmux attach-session -t scratchpad
    	fi
    fi
fi

####################################################
##### alternative fallback-theme (systemd-problem..)
####################################################
tmux set-option -t scratchpad status-style bg=Colour01


####################################################
##### attach...
####################################################
tmux attach-session -t scratchpad 2> /dev/null
