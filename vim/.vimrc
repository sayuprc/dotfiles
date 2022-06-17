scriptencoding utf-8

"--------------------------------------
" Set Dein 
"--------------------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
	call dein#begin('~/.vim/bundles')

	call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

	call dein#add('scrooloose/nerdtree')

	" Ememt
	call dein#add('mattn/emmet-vim')

	" ステータスバー
	call dein#add('itchyny/lightline.vim')

  " 補完系
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
	
  " インデントガイド
  call dein#add('nathanaelkane/vim-indent-guides')

	call dein#end()
	call dein#save_state()
endif

syntax enable

filetype plugin indent on

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
" colorscheme wombat

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
" coc nvim
"--------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-format)
nmap <silent> gh :<C-u>call CocAction('doHover')<cr>

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
