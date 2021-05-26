syntax on

set nu
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set autoindent
set nowrap
set scrolloff=8
set noerrorbells
set cc=80
set signcolumn=yes
set incsearch
set nocompatible

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
set termguicolors 
nnoremap <Leader>ps :Rg<SPACE>
map <SPACE> <C-W>




inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i
" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction
