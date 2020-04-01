#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
# 

##### settings
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Prompt look
PS1='[\u@\h \W]\$ '

##### history
export HISTCONTROL=ignoredups:erasedups:ignorespace
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

##### Base16 Shell
if xhost >& /dev/null ; then
	BASE16_SHELL="$HOME/.config/base16-shell/"
	[ -n "$PS1" ] && \
    	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	        eval "$("$BASE16_SHELL/profile_helper.sh")"
else echo "Display invalid" ; fi

##### Aliases
alias nm='nmtui'
alias mem='sudo ps_mem'
alias dotfiles='/usr/bin/git --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'

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

