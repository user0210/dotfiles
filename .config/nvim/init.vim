

""""" functions
function! Invertfg()
    :let &background = ( &background == "light"? "dark" : "light" )
    :hi Normal ctermbg=none
endfunction


""""" keymap
map <F1> :call Invertfg()<CR>
map <F2> :NERDTreeToggle<CR>


""""" settings
let mapleader=","
set number relativenumber
"set paste


""""" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'lilydjwg/colorizer'
"Plug 'lervag/vimtex'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
call plug#end()

"set t_Co=256


""""" setting from base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


""""" airline stuff
"let g:airline_powerline_fonts = 1
autocmd VimEnter * hi Normal ctermbg=none
