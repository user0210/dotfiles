#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
 
source ~/.profile


##### settings
####################################################

  ## If not running interactively, don't do anything
[[ $- != *i* ]] && return

  ## allow comments in the shell
setopt interactive_comments
PROMPT_EOL_MARK=''

  ## remove acationally % at end of line
unsetopt prompt_cr prompt_sp

  ## use OS file locking
setopt HIST_FCNTL_LOCK

  ## history
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt APPEND_HISTORY
## save to history after every command 
#setopt INC_APPEND_HISTORY

  ## vim keys
bindkey -v
#export KEYTIMEOUT=1

  ## The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

  ## update window-title-name to current dir...
case $TERM in
	tmux-256color*)
		precmd () {print -Pn "\e]0;`basename ${PWD}`"}
		;;
esac


##### theme
####################################################

  ## spaceship theme
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

  ## sections
SPACESHIP_PROMPT_ORDER=(
	time			# Time stamps section
	user			# Username section
	dir				# Current directory section
	host			# Hostname section
	git				# Git section (git_branch + git_status)
#	hg				# Mercurial section (hg_branch  + hg_status)
#	package			# Package version
#	node			# Node.js section
#	ruby			# Ruby section
#	elixir			# Elixir section
#	xcode			# Xcode section
#	swift			# Swift section
#	golang			# Go section
#	php				# PHP section
#	rust			# Rust section
#	haskell			# Haskell Stack section
#	julia			# Julia section
#	docker			# Docker section
#	aws				# Amazon Web Services section
#	gcloud			# Google Cloud Platform section
#	venv			# virtualenv section
#	conda			# conda virtualenv section
#	pyenv			# Pyenv section
#	dotnet			# .NET section
#	ember			# Ember.js section
#	kubectl			# Kubectl context section
#	terraform		# Terraform workspace section
	exec_time		# Execution time
	line_sep		# Line break
#	battery			# Battery level and status
	vi_mode			# Vi-mode indicator
	jobs			# Background jobs indicator
	exit_code		# Exit code section
	char			# Prompt character
)

autoload -U promptinit; promptinit
prompt spaceship

spaceship_vi_mode_enable

  ## cursor
#bindkey -v
#export KEYTIMEOUT=1
#
## Change cursor with support for inside/outside tmux
#function _set_cursor() {
#    if [[ $TMUX = '' ]]; then
#      echo -ne $1
#    else
#      echo -ne "\ePtmux;\e\e$1\e\\"
#    fi
#}
#
#function _set_block_cursor() { _set_cursor '\e[2 q' }
#function _set_beam_cursor() { _set_cursor '\e[6 q' }
#
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#      _set_block_cursor
#  else
#      _set_beam_cursor
#  fi
#}
#zle -N zle-keymap-select
## ensure beam cursor when starting new terminal
#precmd_functions+=(_set_beam_cursor) #
## ensure insert mode and beam cursor when exiting vim
#zle-line-init() { zle -K viins; _set_beam_cursor }

##### source stuff...
####################################################

  ## highlight and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  ## fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
