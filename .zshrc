#         _
# _______| |__  _ __ ___
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__
#/___|___/_| |_|_|  \___|
#
source /home/philipp/.profile

####################################################
##### settings
####################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
setopt HIST_IGNORE_ALL_DUPS

# vim keys
bindkey -v
#export KEYTIMEOUT=1

# The following lines were added by compinstall
zstyle :compinstall filename '/home/philipp/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# update window-title-name to current dir...
case $TERM in
	tmux-256color*)
		precmd () {print -Pn "\e]0;`basename ${PWD}`"}
		;;
esac

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

##### Base16 Shell
if [[ $(mondo get theme) == pywal ]]; then
#	(cat ~/.config/wpg/sequences &)
	:
else
	if xhost >& /dev/null ; then
		BASE16_SHELL="$HOME/.config/base16-shell/"
		[ -n "$PS1" ] && \
	    	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
		        eval "$("$BASE16_SHELL/profile_helper.sh")"
	#else echo "Display invalid"
	fi
fi

####################################################
##### source stuff...
####################################################

##### highlight and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

##### fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

##### nvcode
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
