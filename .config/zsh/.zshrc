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

  ## fallback theme
# PROMPT="[%~]"$'\n'"> "

  ## cursor
bindkey -v
export KEYTIMEOUT=1

# Change cursor with support for inside/outside tmux
function _set_cursor() {
    if [[ $TMUX = '' ]]; then
      echo -ne $1
    else
      echo -ne "\ePtmux;\e\e$1\e\\"
    fi
}

function _set_block_cursor() { _set_cursor '\e[2 q' }
function _set_beam_cursor() { _set_cursor '\e[6 q' }

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
      _set_block_cursor
  else
      _set_beam_cursor
  fi
}
zle -N zle-keymap-select
# ensure beam cursor when starting new terminal
precmd_functions+=(_set_beam_cursor) #
# ensure insert mode and beam cursor when exiting vim
zle-line-init() { zle -K viins; _set_beam_cursor }


##### source stuff...
####################################################

  ## spaceship prompt
source ~/.config/spaceship/spaceship-vi-mode.plugin.zsh
source /usr/lib/spaceship-prompt/spaceship.zsh

  ## highlight and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  ## fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
