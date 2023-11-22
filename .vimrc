
" keep file history
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" update on changes outside of vim
set autoread
" Security
set modelines=0

" Show line numbers
set number
" set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap linebreak " wrap lines at end of window; dont break in words
set showbreak=-->  " icon for wrapped lines
"match ErrorMsg '\%>80v.\+' " highlight after cat 80
set mouse=a  " dont select line numbers when using mouse
"set textwidth=79

set splitbelow  " split right and bottom
set splitright

set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
set noshiftround


" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
"set laststatus=2

" Last line
"set showmode
"set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" fix ^M when copy pasting
set t_BE=

