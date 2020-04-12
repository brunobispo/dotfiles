call plug#begin('~/.config/nvim/autoload')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'gregsexton/MatchTag'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

set nocompatible
set smartindent
set autoindent
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set clipboard+=unnamedplus
set notimeout
set mouse=a
set noshowmode
set hidden
set nobackup
set nowritebackup

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" don't render special chars (tabs, trails, ...)
set nolist
" lazy drawing
set lazyredraw
set ttyfast

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Increase max ctrlp depth
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=100

" Theme
let g:tmuxline_powerline_separators = 0
let g:lightline = {'colorscheme': 'molokai'}

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0

set background=dark
if &term=~'linux'
  colorscheme default
else
  colorscheme gruvbox
endif

map <C-\> :NERDTreeToggle<CR>

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
