#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|
 

##### Settings
##################################################################

  ## add ~/.local/bin to PATH
path_prepend() {
    for arg in "$@"; do
        if [[ ":${PATH}:" != *":${arg}:"* ]]; then
            export PATH="${arg}${PATH:+":$PATH"}"
        fi
    done
}
path_append() {
    for arg in "$@"; do
        if [[ ":${PATH}:" != *":${arg}:"* ]]; then
            export PATH="${PATH:+"$PATH:"}${arg}"
        fi
    done
}
path_append $HOME/.local/bin

  ## onefetch autostart fot git folders
LAST_REPO=""
cd() {
	builtin cd "$@"
	git rev-parse --show-toplevel 2>/dev/null

	if [ $? -eq 0 ]; then
		if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
			clear
			onefetch --no-palette
			LAST_REPO=$(basename $(git rev-parse --show-toplevel))
		fi
	fi
}

  ## set lf icons
[ -f "$HOME/.config/lf/icons" ] && source "$HOME/.config/lf/icons"

  ## broot
source "$HOME/.config/broot/launcher/shell/br"

  ## tab-spaces
tabs -4
export HIGHLIGHT_OPTIONS="replace-tabs=4"

  ## for apps to know the colorspace
export COLORTERM=truecolor

  ## colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

  ## set askpass... (for dmenumount)
export SUDO_ASKPASS="/usr/lib/ssh/ssh-askpass"

##### Default programs:
##################################################################

export EDITOR="vim"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"

##### clean home
##################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export LESSHISTFILE="$XDG_CONFIG_HOME/lesshst"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export TREE_SITTER_DIR="$XDG_CONFIG_HOME/tree-sitter"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export GOPATH="$XDG_DATA_HOME/go"
export HISTFILE="$XDG_CACHE_HOME/history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

  ## Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx ~/.config/X11/xinitrc

  ## source color-scheme (not in use because of alpha issue)
## check if display-server is available:
#if xhost >& /dev/null ; then
#	# check if shell is interactive:
#	[ -n "$PS1" ] && \
#		source ~/.config/X11/xfiles/shell
#fi

##### Aliases
##################################################################

alias startx='startx ~/.config/X11/xinitrc'
alias less='less -x4'
alias nm='nmtui'
alias mem='sudo ps_mem'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.local/src/dotfiles/ --work-tree=$HOME'
alias pacinstall="pacman -Slq | fzf -m --preview \"cat <(pacman -Si {1}) <(pacman -Fl {1} | awk '{print \$2}')\" | xargs -ro sudo pacman -S"
alias yayinstall="yay -Slq | fzf -m --preview \"yay -Si {1}\"| xargs -ro yay -S"
alias yaydelete="yay -Qeq | fzf -m --preview \"yay -Qi {1}\" | xargs -ro yay -Rns"
alias svim="sudoedit"
alias bluetoothctl='audiosel pipe && bluetoothctl'
alias xclip="xclip -selection c"
alias xclip="xclip -b"
alias multimc="multimc --platformtheme qt5ct"
alias mimeopen="mimeopen -d"
alias dosbox="dosbox -conf $XDG_CONFIG_HOME/dosbox/dosbox.conf"
alias yt="ytfzf -ft"
alias mc="tmux splitw -l 58% -hb lf -config ~/.config/lf/mc-right; lf -config ~/.config/lf/mc-left && tmux lastp -Z 2> /dev/null \; resize-pane -Z"
# pkexec as gksudo replacement
alias pkexec="pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.config/dircolors && eval "$(dircolors -b ~/.config/dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
fi
if command -v lsd &> /dev/null; then
	alias ls='lsd'
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
