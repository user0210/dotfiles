function! Invertfg()
    :let &background = ( &background == "light"? "dark" : "light" )
    :hi Normal ctermbg=none
endfunction
map <F1> :call Invertfg()<CR>

map <F2> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1

set number relativenumber
set paste

call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'lilydjwg/colorizer'
call plug#end()

let base16colorspace=256
colorscheme base16-default-dark
set t_Co=256
"set background=light


autocmd VimEnter * hi Normal ctermbg=none
