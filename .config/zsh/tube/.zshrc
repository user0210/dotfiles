. /home/philipp/.zshrc

tmux new-session -d -s tube -n browse "mpsyt && pkill -f tube"
tmux set-option -t tube status-style bg=Colour05
tmux set-option -t tube pane-border-style fg=Colour18,bg=Colour18
tmux set-option -t tube pane-active-border-style fg=Colour18,bg=Colour18
tmux split-window -v -p 10 -t tube cava
tmux selectp -t 1
tmux attach-session -t tube \; set-option destroy-unattached
