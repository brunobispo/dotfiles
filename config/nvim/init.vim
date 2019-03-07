call plug#begin('~/.config/nvim/autoload')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/vim-slash'
Plug 'gregsexton/MatchTag'
Plug 'Yggdroot/indentLine'
Plug 'mhartington/oceanic-next'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'gorkunov/smartgf.vim'
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
set mouse=n

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


" Enable lint for React components
let g:jsx_ext_required = 0

let g:ale_linters = {
\   'javascript': ['flow', 'jscs', 'jshint', 'standard', 'xo'],
\}

let g:ale_fixers = {
\   'ruby': [
\       'remove_trailing_lines',
\       'rubocop'
\   ],
\}

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Increase max ctrlp depth
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=100

" Theme
syntax enable
colorscheme OceanicNext

autocmd Filetype coffeescript setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype scss setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab

map <C-\> :NERDTreeToggle<CR>
