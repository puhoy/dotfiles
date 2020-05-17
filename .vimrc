" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin()
" Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-vinegar'  " nicer netrw
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fcpg/vim-waikiki'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify' " like gitgutter, but more vcs
Plug 'tpope/vim-fugitive'
"Plug 'Valloric/YouCompleteMe'
Plug 'ajh17/VimCompletesMe'
Plug 'morhetz/gruvbox' " colorscheme
" syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
call plug#end()


" waikiki config
let g:waikiki_roots = ['~/notes/']
let maplocalleader = "\<F7>"
let g:waikiki_default_maps = 1
let g:waikiki_done = "X"

"NerdTree config
"" open automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"" toggle on ctrl-n
map <C-n> :NERDTreeToggle<CR>

"" show hidden files
let NERDTreeShowHidden=1

" show signify git changes
set statusline=%{sy#repo#get_stats_decorated()}
" show branch in status line
set statusline+=%{FugitiveStatusline()}
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap linebreak " wrap lines at end of window; dont break in words
set showbreak=⤿  " icon for wrapped lines
match ErrorMsg '\%>80v.\+' " highlight after cat 80
set mouse=a  " dont select line numbers when using mouse
"set textwidth=79

set splitbelow  " split right and bottom
set splitright

set formatoptions=tcqrn1
set tabstop=4
  set shiftwidth=4
set softtabstop=4
set expandtab
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
set laststatus=2

" Last line
set showmode
set showcmd

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

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
colorscheme gruvbox
set background=dark "dark theme

