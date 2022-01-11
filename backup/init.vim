" _   _         __     ___
"| \ | | ___  __\ \   / (_)_ __ ___
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"

""""""" functions
""""""""""""""""""""""""""""""""""
function! Invertfg()
    :let &background = ( &background == "light"? "dark" : "light" )
    :hi Normal ctermbg=none
endfunction


""""""" keymap
""""""""""""""""""""""""""""""""""
map <F1> :call Invertfg()<CR>
let mapleader=" "


""""""" settings
""""""""""""""""""""""""""""""""""
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 noexpandtab
set shiftwidth=4
set smartindent
set autoindent
set nowrap
set smartcase
set noswapfile
set undodir=~/.cache/undo
set undofile
set title titlestring=%t

"set cursorline
"set cursorcolumn

nnoremap <Leader>t :set cursorline! cursorcolumn!<CR>

autocmd VimLeave * call system("xsel -ib", getreg('+'))
