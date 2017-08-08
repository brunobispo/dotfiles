execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set smartindent
set autoindent
set number

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType erb setlocal expandtab shiftwidth=2 tabstop=2

map <C-\> :NERDTreeToggle<CR>
