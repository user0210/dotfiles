. /home/philipp/.zshrc

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
tmux set-option -t scratchpad status-position bottom

tmux set-option -t scratchpad status-style fg=colour07,bg=colour18
tmux set-option -t scratchpad status-left-style fg=colour07,bg=colour18
tmux set-option -t scratchpad status-right-style fg=colour07,bg=colour18
tmux set-option -t scratchpad pane-border-style fg=colour18,bg=colour00
tmux set-option -t scratchpad pane-active-border-style fg=colour00,bg=colour18
tmux set-option -t scratchpad display-panes-colour default
tmux set-option -t scratchpad display-panes-active-colour default
tmux set-option -t scratchpad clock-mode-colour colour04
tmux set-option -t scratchpad clock-mode-style 12
tmux set-option -t scratchpad message-style fg=colour18,bg=colour16
tmux set-option -t scratchpad message-command-style fg=colour18,bg=colour16
tmux set-option -t scratchpad mode-style fg=colour18,bg=colour05

tmux set-option -t scratchpad status-left-length 25
tmux set-option -t scratchpad status-left " term #[fg=colour16,bold]#S   #[fg=colour07,nobold]#I ﱞ #P #{prefix_highlight}"
tmux set-option -t scratchpad status-right-length 25
tmux set-option -t scratchpad status-right '#[nobold]#(uptime | rev | cut -d":" -f1 | rev | sed s/,//g ) #[bg=colour18] '
tmux set-option -t scratchpad window-status-format "#[fg=colour07,bg=colour19] #I·#W[#F] "
tmux set-option -t scratchpad window-status-current-format "#[fg=colour00,bg=colour04,bold] #I·#W[#F] "
tmux set-option -t scratchpad window-status-separator "#[bg=colour18]"
tmux set-option -t scratchpad status-justify centre
tmux set-option -t scratchpad window-status-current-style default
tmux set-option -t scratchpad window-status-activity-style default # fg and bg are flipped here due to a bug in tmux
tmux set-option -t scratchpad pane-border-status bottom
tmux set-option -t scratchpad pane-border-format "#[bold][#P]" 
tmux set-option -t scratchpad @prefix_highlight_show_sync_mode 'on'
tmux set-option -t scratchpad @prefix_highlight_show_copy_mode 'on'
tmux set-option -t scratchpad @prefix_highlight_fg 'black'
tmux set-option -t scratchpad @prefix_highlight_bg 'green'
tmux set-option -t scratchpad @prefix_highlight_prefix_prompt 'λ '
tmux set-option -t scratchpad @prefix_highlight_sync_prompt ' '
tmux set-option -t scratchpad @prefix_highlight_copy_prompt ' '
tmux set-option -t scratchpad @prefix_highlight_sync_mode_attr "bg=red,fg=black,bold"
tmux set-option -t scratchpad @prefix_highlight_prefix_mode_attr "bg=yellow,fg=black,bold"
tmux set-option -t scratchpad @prefix_highlight_copy_mode_attr "bg=magenta,fg=black,bold"
tmux set-option -t scratchpad @prefix_highlight_output_prefix ''
tmux set-option -t scratchpad @prefix_highlight_output_suffix ''

####################################################
##### attach...
####################################################
tmux attach-session -t scratchpad 2> /dev/null
