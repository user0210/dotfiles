# disable vim-mode indikator
function fish_mode_prompt; end

# start terminals here
cd /home/philipp/

# disable dangerous greeter
set -U dangerous_nogreeting

# path....
set PATH $PATH /home/philipp/bin

# workaround: mondo sets dangerous_night colors, and this command applys it...
set -U dangerous_colors $dangerous_night

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
