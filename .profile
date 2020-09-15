#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|
# 

# fix pointer with pywal... maybe not needed...
PROMPT_COMMAND='printf "\e]112\a"'

# Default programs:
export EDITOR="nvim"
#export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

####################################################
##### Aliases
####################################################
alias less='less -x4'
alias bs='tmux detach && bash && clear'
alias nm='nmtui'
alias mem='sudo ps_mem'
alias dotfiles='/usr/bin/git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'
alias pacinstall="pacman -Slq | fzf -m --preview \"cat <(pacman -Si {1}) <(pacman -Fl {1} | awk '{print \$2}')\" | xargs -ro sudo pacman -S"
alias yayinstall="yay -Slq | fzf -m --preview \"yay -Si {1}\"| xargs -ro yay -S"
alias yaydelete="yay -Qeq | fzf -m --preview \"yay -Qi {1}\" | xargs -ro yay -Rns"
alias svim="sudoedit"
alias bluetoothctl='audiosel pulse && bluetoothctl'

##### Color output
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.config/dircolors && eval "$(dircolors -b ~/.config/dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
fi
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
