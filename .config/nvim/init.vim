" _   _         __     ___
"| \ | | ___  __\ \   / (_)_ __ ___
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"


""""" functions
function! Invertfg()
    :let &background = ( &background == "light"? "dark" : "light" )
    :hi Normal ctermbg=none
endfunction


""""" settings
let mapleader=","
set number relativenumber
set mouse=a
"set paste
"set t_Co=256


""""" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'unblevable/quick-scope'
"Plug 'lervag/vimtex'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
call plug#end()


""""" keymap
map <F1> :call Invertfg()<CR>
map <F2> :NERDTreeToggle<CR>


""""" setting from base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""""" quick-scope-settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""" airline stuff
let g:airline_powerline_fonts = 1
autocmd VimEnter * hi Normal ctermbg=none
