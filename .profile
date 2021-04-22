#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|
# 

##### add ~/.local/bin to PATH
export PATH=$PATH:/home/philipp/.local/bin

##### HDPI
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.8

##### fix pointer with pywal... maybe not needed...
PROMPT_COMMAND='printf "\e]112\a"'

##### tab-spaces
tabs -4
export HIGHLIGHT_OPTIONS="replace-tabs=4"

##### for apps to know the colorspace
export COLORTERM=truecolor

##### Default programs:
export EDITOR="vim"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"

##### Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

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

####################################################
##### Aliases
####################################################
alias less='less -x4'
alias nm='nmtui'
alias mem='sudo ps_mem'
alias dotfiles='/usr/bin/git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'
alias pacinstall="pacman -Slq | fzf -m --preview \"cat <(pacman -Si {1}) <(pacman -Fl {1} | awk '{print \$2}')\" | xargs -ro sudo pacman -S"
alias yayinstall="yay -Slq | fzf -m --preview \"yay -Si {1}\"| xargs -ro yay -S"
alias yaydelete="yay -Qeq | fzf -m --preview \"yay -Qi {1}\" | xargs -ro yay -Rns"
alias svim="sudoedit"
alias bluetoothctl='audiosel pipe && bluetoothctl'
alias xclip="xclip -selection c"
alias xclip="xclip -b"
