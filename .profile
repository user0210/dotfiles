##### Settings
##################################################################

  ## set DISPLAY for X410
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

 ## qt-settings
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=gnome
#export QT_STYLE_OVERRIDE=Breeze

  ## make localhost work...
unset HOST

  ## chatgptkey
source ~/.ssh/chatgpt

  ## start ssh-agent (for git-ssh)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

  ## from opensuse sample-file
test -z "$PROFILEREAD" && . /etc/profile || true

  ## add ~/.local/bin to PATH
export PATH=:$PATH:$HOME/.local/bin
export PATH=:$PATH:$HOME/.local/share/cargo/bin
#export PATH=:'/mnt/c/Program Files/Mozilla Firefox':$PATH

  ## onefetch autostart fot git folders
LAST_REPO=""
cd() {
    builtin cd "$@"
    git rev-parse --show-toplevel 2>/dev/null

    if [ $? -eq 0 ]; then
        if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
            clear
            onefetch --no-color-palette
            LAST_REPO=$(basename $(git rev-parse --show-toplevel))
        fi
    fi
}

  ## enable custom window-border (for firefox)
export MOZ_GTK_TITLEBAR_DECORATION=client

  ## tab-spaces
tabs -4
export HIGHLIGHT_OPTIONS="replace-tabs=4"

  ## for apps to know the colorspace
export COLORTERM=truecolor

  ## colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

  ## use wsl-vscode!!
export DONT_PROMPT_WSL_INSTALL=code

##### Default programs:
##################################################################

export EDITOR="nvim"
export FILE="lf"
export PAGER="less"

##### clean home
##################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
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
export GNUPLOT_HISTORY="$XDG_CACHE_HOME/gnuplot_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python 
export PYTHONUSERBASE=$XDG_DATA_HOME/python

##### Aliases
##################################################################

alias dotfiles='/usr/bin/git --git-dir=$HOME/.local/src/dotfiles/ --work-tree=$HOME'
alias yt='ytfzf --thumb-viewer=chafa -ft'
alias less='less -x4'
alias svim="sudoedit"
alias vim="nvim"
alias mimeopen="mimeopen -d"
alias ranger="lf"
