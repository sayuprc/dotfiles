scriptencoding utf-8

"--------------------------------------
" Set Dein
"--------------------------------------
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

if &compatible
  set nocompatible
endif

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
let s:toml_dir = expand('~/.config/vim')
call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

if len(dein#check_clean()) > 0
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endif

"--------------------------------------
" Set File Encode
"--------------------------------------
set fenc=utf-8
set encoding=utf-8

"--------------------------------------
" Set Colorscheme
"--------------------------------------
set background=dark
colorscheme iceberg

"--------------------------------------
" Enable use backspace
"--------------------------------------
set backspace=indent,eol,start

"--------------------------------------
" Settings
"--------------------------------------
set nobackup
set nowritebackup
set noundofile
set noswapfile

set hidden

set showmatch

set noshowmode

set title

set expandtab

set tabstop=2

set shiftwidth=2

set smartcase

set noerrorbells visualbell t_vb=

set wildmenu

set clipboard+=unnamed

set colorcolumn=80

"--------------------------------------
" NERDTree
"--------------------------------------
let NERDTreeShowHidden = 1

"--------------------------------------
" lightline
"--------------------------------------
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\ 	'left': [
\			[ 'mode', 'paste' ],
\			[ 'readonly', 'filename', 'modified' ]
\		],
\	},
\}

"--------------------------------------
" Emmet
"--------------------------------------
let g:user_emmet_settings = {
\	'lang': 'ja'
\}

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

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"--------------------------------------
" autocmd
"--------------------------------------
autocmd GUIEnter * setlocal visualbell t_vb=

autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o

autocmd FileType php setlocal tabstop=4 shiftwidth=4
