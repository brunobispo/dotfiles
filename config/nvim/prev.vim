" Plugins {{{
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
<<<<<<< HEAD:config/nvim/prev.vim
Plug 'JoosepAlviste/nvim-ts-context-commentstring', { 'branch': 'main' }
=======
>>>>>>> b5c664cce2ceadb7c8981a8d5ce81c23a236362d:config/nvim/init.vim
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'madox2/vim-ai'
Plug 'evanleck/vim-svelte'
<<<<<<< HEAD:config/nvim/prev.vim
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'github/copilot.vim'
=======
>>>>>>> b5c664cce2ceadb7c8981a8d5ce81c23a236362d:config/nvim/init.vim
call plug#end()
" }}}

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" }}}

" General {{{
"set clipboard=unnamed                | " System clipboard
set clipboard+=unnamedplus
set encoding=UTF-8                   | " Default file encoding
set hidden                           | " Make buffers hidden then abandoned
set noautochdir                      | " Don't change dirs automatically
set noerrorbells                     | " No sound
set signcolumn=yes                   | " Show signcolumns
set splitbelow splitright            | " Split defaults
set undofile                         | " Enable undo persistence across sessions
set smartindent                      | " Auto indent new lines
set spelllang=en                     | " Spell checking
set autoindent
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set notimeout
set mouse=a
set noshowmode
set foldmethod=marker

" Disable comment continuation
autocmd FileType * set formatoptions-=cro
" }}}

" Shortcuts {{{
let mapleader = ","
let maplocalleader = ","

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>\ :NERDTreeToggle<cr>
nnoremap <leader>\| :NERDTreeFind<cr>

nnoremap <leader>ff :call CocActionAsync('format')<cr>
nnoremap <leader>fp :call CocAction('runCommand', 'prettier.formatFile')<cr>
nnoremap <leader>fj :%!python -m json.tool<cr>
nnoremap <leader>cp :let @+ = expand("%")<cr>

nnoremap <leader>p :Files<cr>
nnoremap <leader>P :History<cr>

iabbrev @@ me@brunobispo.com

inoremap jk <esc>
inoremap <esc> <nop>

" Prevent jump when search *
nnoremap * *``
" }}}

" Theme {{{
set background=dark
let base16colorspace=256
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set noshowmode
set novisualbell
set nowrap
set number
set showmatch
highlight Comment gui=italic,bold
" }}}

" AG {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" Airline {{{
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" Conquer of Completion {{{

" Install extensions
<<<<<<< HEAD:config/nvim/prev.vim
let g:coc_global_extensions=[ 'coc-cssmodules', 'coc-prettier', 'coc-css', 'coc-tsserver', 'coc-omnisharp', 'coc-eslint', 'coc-svg', 'coc-svelte', '@yaegassy/coc-tailwindcss3']
=======
let g:coc_global_extensions=[ 'coc-cssmodules', 'coc-prettier', 'coc-css', 'coc-tsserver', 'coc-omnisharp', 'coc-eslint', 'coc-svg', 'coc-svelte']

>>>>>>> b5c664cce2ceadb7c8981a8d5ce81c23a236362d:config/nvim/init.vim

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <leader>f to format
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Remove messages from in-completion menus
set shortmess+=c
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Colors
highlight CocCodeLens gui=italic,bold guifg=#505050
" }}}

" coc-css {{{
autocmd FileType scss setl iskeyword+=@-@
" }}}

" indentLine {{{
let g:indentLine_setConceal = 2
" default ''.
" n for Normal mode
" v for Visual mode
" i for Insert mode
" c for Command line editing, for 'incsearch'
let g:indentLine_concealcursor = ""
" }}}

" NERDTree {{{
" Fix incresing of command line size
let g:NERDTreeMinimalMenu=1
" }}}

" FZF {{{
" Ignore node_modules files
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
" }}}

" vim-ai {{{
" set default model and temperature
let g:vim_ai_chat = {
\  "options": {
<<<<<<< HEAD:config/nvim/prev.vim
\    "model": "gpt-4o",
=======
\    "model": "gpt-4-1106-preview",
>>>>>>> b5c664cce2ceadb7c8981a8d5ce81c23a236362d:config/nvim/init.vim
\    "max_tokens": 1000,
\    "temperature": 0.5,
\  }
\}
<<<<<<< HEAD:config/nvim/prev.vim

let g:vim_ai_roles_config_file = 'Library/Mobile Documents/com~apple~CloudDocs/AI'
=======
>>>>>>> b5c664cce2ceadb7c8981a8d5ce81c23a236362d:config/nvim/init.vim
" }}}
