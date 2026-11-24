set encoding=utf-8
scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

filetype plugin indent on
syntax on

set background=dark

"--------------------------------------
" Settings
"--------------------------------------
set backspace=indent,eol,start

set nobackup
set nowritebackup
set noundofile
set noswapfile

set hidden

set showmatch

set title

set laststatus=2

set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase

set noerrorbells visualbell t_vb=

set wildmenu

set clipboard+=unnamed

set colorcolumn=80,120

"--------------------------------------
" Keymap
"--------------------------------------
inoremap jj <Esc>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent>- :split<CR>
nnoremap <silent><Bar> :vsplit<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

"--------------------------------------
" autocmd
"--------------------------------------
autocmd vimrc GUIEnter * setlocal visualbell t_vb=
autocmd vimrc FileType * setlocal formatoptions-=r formatoptions-=o
autocmd vimrc FileType php setlocal tabstop=4 shiftwidth=4
