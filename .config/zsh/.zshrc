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

# wsl-systemd issue (on opensuse).. nedd this for tmux to work
export TMUX_TMPDIR='/tmp'

# autostart tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || exec tmux >/dev/null 2>&1
fi

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

  ## The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

  ## base16 colors
case $TERM in
	tmux-256color*)
		~/.local/bin/shell
		;;
esac

  ## tmux settings
case $TERM in
	tmux-256color*)
		precmd () {print -Pn "\e]0;`basename ${PWD}`"}
		;;
esac


##### source stuff...
####################################################

  ## spaceship prompt
source ~/.config/zsh/spaceship-vi-mode.plugin.zsh
source ~/.config/zsh/spaceship-prompt/spaceship.zsh

  ## highlight and autosuggestions
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

  ## fzf
source /etc/zsh_completion.d/fzf-key-bindings

 ## broot
 source ~/.config/broot/launcher/bash/br
