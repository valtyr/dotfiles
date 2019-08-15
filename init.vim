" disable vi compatibility
set nocompatible

set backspace=indent,eol,start

" automatically load changed files
set autoread

" auto-reload vimrc
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backupf

" display incomplete commands at the bottom
set showcmd

" mouse support
set mouse=a

" line numbers
set number

" highlight cursor line
set cursorline

" wrapping stuff
set colorcolumn=120

" remember last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

" show '>   ' at the beginning of lines that are automatically wrapped
set showbreak=>\ \ \

" enable completion
set ofu=syntaxcomplete#Complete

" make laggy connections work faster
set ttyfast

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

"""""""""""""
" Searching "
"""""""""""""

set hlsearch "when there is a previous search pattern, highlight all its matches
set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

"""""""""""""
" Indenting "
"""""""""""""

" When auto-indenting, use the indenting format of the previous line
set copyindent
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab
" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent
" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

"""""""""
" Theme "
"""""""""

syntax enable
set background=dark "uncomment this if your terminal has a dark background


"remove menu bar
set guioptions-=m

"""""""""""""""""""""
" Language-Specific "
"""""""""""""""""""""

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=json syntax=javascript

set tabstop=2
set shiftwidth=2
set expandtab
set inccommand=nosplit
 
call plug#begin()

Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'liuchengxu/space-vim-dark'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'Raimondi/delimitMate'

call plug#end()


map <C-e> :FZF<CR>
map <C-t> :call fzf#run({'source': 'git ls-files', 'sink': 'tab drop'})<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-x> :ALEFix<CR>

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_column_always = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['standard'],
\   'graphql': [],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'python': ['black', 'isort'],
\}

let g:ale_set_loclist = 0
let g:ale_fix_on_save = 1
let g:ale_virtualenv_dir_names = ['venv', '.venv']


colorscheme space-vim-dark
hi Comment    cterm=italic guifg=#5C6370 ctermfg=59
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set clipboard=unnamedplus

set tw=0
set textwidth=0 wrapmargin=0
set formatoptions-=tc
