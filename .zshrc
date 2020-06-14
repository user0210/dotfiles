#         _
# _______| |__  _ __ ___
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__
#/___|___/_| |_|_|  \___|
#

####################################################
##### settings
####################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export DISPLAY=:0.0

tabs -4

# HDPI
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.8

setopt interactive_comments

# history
HISTFILE=~/.bash_history
HISTSIZE=8000
SAVEHIST=5000
setopt HIST_IGNORE_SPACE

# vim keys
bindkey -v
#export KEYTIMEOUT=1

# The following lines were added by compinstall
zstyle :compinstall filename '/home/philipp/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

####################################################
##### theme
####################################################

# spaceship theme

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX="["
SPACESHIP_PROMPT_DEFAULT_SUFFIX="]"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL="> "
SPACESHIP_CHAR_SYMBOL_ROOT="# "
SPACESHIP_VI_MODE_SUFFIX=" "
SPACESHIP_VI_MODE_PREFIX="╰╼ "
SPACESHIP_VI_MODE_INSERT=">>"
SPACESHIP_VI_MODE_NORMAL="<<"
SPACESHIP_DIR_PREFIX="["
SPACESHIP_DIR_SUFFIX="]"
SPACESHIP_DIR_TRUNC=0
#SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_PREFIX="["
SPACESHIP_GIT_SUFFIX="]"
SPACESHIP_EXEC_TIME_PREFIX="["
SPACESHIP_EXEC_TIME_SUFFIX="]"
SPACESHIP_EXEC_TIME_ELAPSED=1

autoload -U promptinit; promptinit
prompt spaceship

spaceship_vi_mode_enable

####################################################
##### bashrc import
####################################################

##### Base16 Shell
if xhost >& /dev/null ; then
	BASE16_SHELL="$HOME/.config/base16-shell/"
	[ -n "$PS1" ] && \
    	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	        eval "$("$BASE16_SHELL/profile_helper.sh")"
#else echo "Display invalid"
fi

##### Aliases
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

##### highlight and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

##### fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
