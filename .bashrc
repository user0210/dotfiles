#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
# 
source /home/philipp/.profile

##### settings
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

tabs -4

# HDPI
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.8

# Prompt look
PS1="\[\e[37m\][\[\e[m\]\w\[\e[37m\]]\[\e[m\]\[\e[31m\]\\$\[\e[m\] "
#PS1='[\u@\h \W]\$ '


##### history
export HISTCONTROL=ignoredups:erasedups:ignorespace
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


##### base16
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


##### fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

##### nvcode
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
