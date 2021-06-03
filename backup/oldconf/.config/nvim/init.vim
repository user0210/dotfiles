" _   _         __     ___
"| \ | | ___  __\ \   / (_)_ __ ___
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"
"


""""""" plugins
""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'unblevable/quick-scope'
Plug 'lervag/vimtex'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

"gitgutter alternative...
"Plug 'mhinz/vim-signify'

"always the last plugin to load...
Plug 'ryanoasis/vim-devicons'

call plug#end()


""""""" functions
""""""""""""""""""""""""""""""""""
function! Invertfg()
    :let &background = ( &background == "light"? "dark" : "light" )
    :hi Normal ctermbg=none
endfunction


""""""" keymap
""""""""""""""""""""""""""""""""""
map <F1> :call Invertfg()<CR>
map <F2> :NERDTreeToggle<CR>
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
set undodir=~/.config/nvim/undodir
set undofile
set title titlestring=%t
"set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t\ -\ Vim

set cursorline
set cursorcolumn
nnoremap <Leader>t :set cursorline! cursorcolumn!<CR>

autocmd VimLeave * call system("xsel -ib", getreg('+'))

"set paste
"set t_Co=256
"set clipboard=unnamedplus


""""""" PLUGIN base16-shell
""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc_background"))
  set termguicolors
  let base16colorspace=256
  source ~/.vimrc_background
  highlight LineNr guibg=0 guifg=8
else
  colorscheme wal
  hi LineNr ctermbg=NONE ctermfg=8
  hi CursorLineNr ctermbg=0 ctermfg=1
  hi CursorLine term=bold cterm=bold ctermbg=0 ctermfg=NONE
  hi CursorColumn ctermbg=0 ctermfg=NONE
  hi Pmenu ctermbg=0 ctermfg=5
  hi Comment ctermbg=NONE ctermfg=6
  hi TabLine ctermbg=NONE ctermfg=6
  hi TabLineFill ctermbg=NONE ctermfg=6
  hi LineNr ctermbg=NONE ctermfg=6
  hi CursorLineNr ctermbg=NONE ctermfg=6
  hi PmenuThumb ctermbg=8 ctermfg=6
  hi Folded ctermbg=NONE ctermfg=6
  hi SpecialKey ctermbg=NONE ctermfg=6
  hi DiffChange ctermbg=NONE ctermfg=6
  hi MatchParen ctermbg=1 ctermfg=6
  hi ErrorMsg ctermbg=NONE ctermfg=6
  hi Cursor ctermbg=NONE ctermfg=6
  hi vimCommentString ctermbg=NONE ctermfg=6
  hi cssNoise ctermbg=NONE ctermfg=6
  hi rubyTodo ctermbg=NONE ctermfg=6
endif
hi! Normal ctermbg=NONE guibg=NONE

""""""" PLUGIN quick-scope
""""""""""""""""""""""""""""""""""
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


""""""" PLUGIN vimtex
""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'


""""""" PLUGIN airline
""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline#extensions#tabline#enabled = 0
autocmd VimEnter * hi Normal ctermbg=none


""""""" PLUGIN compe
""""""""""""""""""""""""""""""""""
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat


""""""" PLUGIN nvim-lspconfig
""""""""""""""""""""""""""""""""""
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.bashls.setup{}


""""""" PLUGIN coc-nvim
""""""""""""""""""""""""""""""""""
"set hidden
"set nobackup
"set nowritebackup
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes
"
""inoremap <silent><expr> <TAB>
""      \ pumvisible() ? "\<C-n>" :
""      \ <SID>check_back_space() ? "\<TAB>" :
""      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"" Use <TAB> for selections ranges.
"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
"" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"" Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
