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
set number relativenumber
set mouse=a
set clipboard=unnamedplus
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set colorcolumn=80

let mapleader=" "
autocmd VimLeave * call system("xsel -ib", getreg('+'))
"set paste
"set t_Co=256


""""" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'unblevable/quick-scope'
Plug 'lervag/vimtex'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
"always the last plugin to load...
Plug 'ryanoasis/vim-devicons'
call plug#end()


""""" keymap
map <F1> :call Invertfg()<CR>
map <F2> :NERDTreeToggle<CR>


""""" settings base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""""" settings quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""""" settings vimtex
let g:vimtex_compiler_progname = 'nvr'

""""" settings airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
autocmd VimEnter * hi Normal ctermbg=none
