"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

call plug#begin()
Plug 'tpope/vim-vinegar'  " nicer netrw

" file tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show git changes
Plug 'mhinz/vim-signify'
" git commands in vim
Plug 'tpope/vim-fugitive'

" visualize undos
Plug 'mbbill/undotree'

" display buffers as 'tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim', { 'branch': 'main' }

Plug 'monsonjeremy/onedark.nvim'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" generate missing lsp colors
"Plug 'folke/lsp-colors.nvim', { 'branch': 'main' }

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" add 'surroundings'
Plug 'tpope/vim-surround'

"Plug 'Chiel92/vim-autoformat'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" pgp
Plug 'jamessan/vim-gnupg'

" lsp
Plug 'neovim/nvim-lspconfig'
" lsp autocomplete
Plug 'hrsh7th/nvim-compe'

" nicer ui
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }


" install languageservers
Plug 'kabouzeid/nvim-lspinstall', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let mapleader=","

lua<<end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable signs
   signs = true,
   virtual_text = {severity_limit = "Error",},
   underline = true,
 }
)




end

set updatetime=300
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()


let g:VM_mouse_mappings = 1
nmap <A-LeftMouse> <Plug>(VM-Mouse-Cursor)


source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/signify.vim
source ~/.config/nvim/config/undotree.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/wiki.vim

source ~/.config/nvim/config/lsp.lua
source ~/.config/nvim/config/compe.lua
source ~/.config/nvim/config/lspsaga.lua
source ~/.config/nvim/config/lspsaga_keymap.lua
source ~/.config/nvim/config/lspinstall.lua
source ~/.config/nvim/config/treesitter.lua

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


