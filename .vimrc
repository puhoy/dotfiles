" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin()
"Plug 'tpope/vim-vinegar'  " nicer netrw
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" wiki
Plug 'fcpg/vim-waikiki'
" file tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show git changes
Plug 'mhinz/vim-signify' 
" git commands in vim
Plug 'tpope/vim-fugitive' 

" syntax highlighting
Plug 'sheerun/vim-polyglot'
" autoformat files
Plug 'Chiel92/vim-autoformat'

" autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" jump to definition
Plug 'davidhalter/jedi-vim'


" visualize undos
Plug 'mbbill/undotree'


" display buffers as 'tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" automatic generate ctags (needs ctags installed)
Plug 'ludovicchabant/vim-gutentags'

" colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

" toggle file history
nnoremap <F5> :UndotreeToggle<cr>

" remove unused imports 
"" python (needs autoflake)
autocmd FileType python noremap <C-A-o> :!autoflake --in-place --remove-unused-variables %<CR>

" autoformatting
noremap <C-A-l> :Autoformat<CR>

" autosave
:au FocusLost * silent! wa

" we use deoplete for completion - disable jedi
let g:jedi#completions_enabled = 0


" show buffers
" https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" use system python, not venv
let g:python3_host_prog = '/usr/bin/python3'

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

"" ignore files
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'tags']

"" keep file history
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

