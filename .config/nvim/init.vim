"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

call plug#begin()
Plug 'tpope/vim-vinegar'  " nicer netrw

" file tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'lambdalisue/fern.vim'
"Plug 'lambdalisue/fern-git-status.vim'
"Plug 'lambdalisue/fern-renderer-nerdfont.vim'
"Plug 'LumaKernel/fern-mapping-reload-all.vim'
"Plug 'lambdalisue/nerdfont.vim'

Plug 'tpope/vim-vinegar'

" ncm2 requirement
Plug 'roxma/nvim-yarp' 
Plug 'ncm2/ncm2'
"python
Plug 'ncm2/ncm2-jedi'
" js, ts
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-vim'
" have gotodefinition and jedi keybindings...
Plug 'davidhalter/jedi-vim'

" linting
Plug 'dense-analysis/ale'

" show git changes
Plug 'mhinz/vim-signify'
" git commands in vim
Plug 'tpope/vim-fugitive'

" visualize undos
Plug 'mbbill/undotree'

" display buffers as 'tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" automatic generate ctags (needs ctags installed)
Plug 'ludovicchabant/vim-gutentags'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'huytd/vim-espresso-tutti'


" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" add 'surroundings'
Plug 'tpope/vim-surround'

" markdown rendering (conceal links etc..)
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" distraction free writing
Plug 'junegunn/goyo.vim'

Plug 'vim-python/python-syntax'

"Plug 'junegunn/limelight.vim'

call plug#end()

let g:python_highlight_all = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

let g:VM_mouse_mappings = 1
nmap <A-LeftMouse> <Plug>(VM-Mouse-Cursor)

source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/signify.vim
source ~/.config/nvim/config/undotree.vim
source ~/.config/nvim/config/wiki.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/ncm2.vim
source ~/.config/nvim/config/jedi.vim
source ~/.config/nvim/config/gutentags.vim

"source ~/.config/nvim/config/coc.vim

source ~/.vimrc
source ~/.config/nvim/config/main.vim


" open nonexistent file under cursor
map <leader>gf :e <cfile><cr>

" move through visual wrapped lines instead of real lines
noremap <silent> <UP> gk
noremap <silent> <DOWN> gj
noremap <silent> 0 g0
noremap <silent> $ g$

" append random alphanumeric string to current line
command! -nargs=1 Random :call setline(line('.'), getline(line('.')) .  system("strings -n 1 < /dev/urandom |  tr -dc 'a-zA-Z0-9' | fold -w " . <f-args> . " |  head -n 1 | tr -d '\n'"))

" set working dir to current file
"autocmd BufEnter * silent! lcd %:p:h
let g:goyo_height= '100%'


syntax on

"" dependencies
" pip 
" - flake
"   jedi
"   pynvim
"   autoflake
"   autopep8
"   flake8
"   pylint
"   mypy  # test for type annotations 

" xmllint  # autoformat xml
" the_silver_searcher  # code search with FZFs :Ag
" nerd-fonts-noto-sans-mono  # symbols for fern tree todo: thats probably not
" the needed font?


