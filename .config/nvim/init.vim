"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

call plug#begin()
"Plug 'tpope/vim-vinegar'  " nicer netrw
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" wiki
Plug 'fcpg/vim-waikiki'
" file tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" syntax highlights
Plug 'vim-syntastic/syntastic'

" show git changes
Plug 'mhinz/vim-signify'
" git commands in vim
Plug 'tpope/vim-fugitive'

" syntax highlighting
Plug 'sheerun/vim-polyglot'
" autoformat files
Plug 'Chiel92/vim-autoformat'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-docker'


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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()



let g:deoplete#enable_at_startup = 1


source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/autoformat.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/jedi.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/signify.vim
source ~/.config/nvim/config/syntastic.vim
source ~/.config/nvim/config/undotree.vim
source ~/.config/nvim/config/waikiki.vim


source ~/.vimrc
source ~/.config/nvim/config/main.vim

