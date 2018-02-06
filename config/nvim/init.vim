call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-haml'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-ruby/vim-ruby'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vim-slash'
Plug 'gregsexton/MatchTag'
Plug 'Yggdroot/indentLine'
call plug#end()

set nocompatible
set smartindent
set autoindent
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

autocmd Filetype coffeescript setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype scss setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab

map <C-\> :NERDTreeToggle<CR>

if $TERM_PROGRAM =~ "iTerm"
	if exists('$TMUX')
		let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
		let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
	else
		let &t_SI = "\<esc>]50;CursorShape=1\x7"
		let &t_EI = "\<esc>]50;CursorShape=0\x7"
	endif
endif

set clipboard+=unnamedplus
