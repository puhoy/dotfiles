"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

call plug#begin()
"Plug 'tpope/vim-vinegar'  " nicer netrw
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" wiki
Plug 'fcpg/vim-waikiki'

Plug 'mhinz/vim-startify'

" file tree
"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-reload-all.vim'
Plug 'lambdalisue/nerdfont.vim'

" syntax highlighting, linting
Plug 'dense-analysis/ale'

" show git changes
Plug 'mhinz/vim-signify'
" git commands in vim
Plug 'tpope/vim-fugitive'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" autoformat files
Plug 'Chiel92/vim-autoformat'

" autocomplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
"Plug 'deoplete-plugins/deoplete-docker'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp' " ncm2 dependency
" paths
Plug 'ncm2/ncm2-path'
" python
Plug 'ncm2/ncm2-jedi' 
" javascript
Plug 'ncm2/ncm2-tern'
" typescript
"Plug 'mhartington/nvim-typescript'
" css
Plug 'ncm2/ncm2-cssomni'
" go
Plug 'ncm2/ncm2-go'
" php
Plug 'phpactor/ncm2-phpactor'

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
Plug 'NLKNguyen/papercolor-theme'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" add 'surroundings'
Plug 'tpope/vim-surround'
" . repeat for some plugins supporting it (vim-surround, tpope stuff)
Plug 'tpope/vim-repeat'

" snippets
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

call plug#end()


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/autoformat.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/jedi.vim
"source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/fern.vim
source ~/.config/nvim/config/signify.vim
"source ~/.config/nvim/config/syntastic.vim
source ~/.config/nvim/config/undotree.vim
source ~/.config/nvim/config/waikiki.vim
source ~/.config/nvim/config/ncm2.vim
source ~/.config/nvim/config/startify.vim
source ~/.config/nvim/config/ale.vim
source ~/.config/nvim/config/gutentags.vim


source ~/.vimrc
source ~/.config/nvim/config/main.vim



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


