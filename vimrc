execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set smartindent
set autoindent
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 expandtab

autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype coffeescript setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype jade setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab

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
