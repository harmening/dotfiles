set term=screen-256color
set t_Co=256
call pathogen#infect()
syntax enable
set encoding=utf-8

set mouse=a

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set showcmd
set ruler
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=2
set autoindent
set textwidth=79
"set colorcolumn=80
"set noswapfile
set autoread
set hidden
set history=10000
set clipboard=unnamedplus
"set foldmethod=indent
"set foldnestmax=10
"set nofoldenable
"set foldlevel=1
set background=dark
set guioptions-=T "toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=l "remove left-hand scroll bar
set guifont="Monospace Regular 8"
filetype plugin indent on
syntax on