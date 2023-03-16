"set runtimepath^=~/.vim  and EOLuntimepath+=~/.vim/after let &packpath
"= &runtimepath

call plug#begin()
Plug 'tpope/vim-vinegar'  " nicer netrw

" file tree
"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
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
Plug 'ellisonleao/gruvbox.nvim', { 'branch': 'main' }


Plug 'monsonjeremy/onedark.nvim'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'sainnhe/edge'

"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" fuzzy finder
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
"Plug 'hrsh7th/nvim-compe'
"Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'

" treesitter completion source
Plug 'nvim-treesitter/completion-treesitter'

" install languageservers
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ray-x/lsp_signature.nvim'

" Vim Script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

"Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'chrisbra/csv.vim'

Plug 'gpanders/editorconfig.nvim'


Plug 'numToStr/Comment.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
call plug#end()

let mapleader=","


lua<<end
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable signs
   signs = true,
   virtual_text = false,
   underline = true,
 }
)
end

nnoremap <leader>xx <cmd>TroubleToggle<cr>
let g:VM_mouse_mappings = 1
nmap <A-LeftMouse> <Plug>(VM-Mouse-Cursor)


nmap gx :!open <c-r><c-a>

lua << EOF
-- lsp server setup
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --["rust_analyzer"] = function ()
    --    require("rust-tools").setup {}
    --end
}
EOF

source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/fzf.vim
"source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/nvim-tree.vim
source ~/.config/nvim/config/nvim-tree.lua
source ~/.config/nvim/config/signify.vim
source ~/.config/nvim/config/undotree.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/wiki.vim

source ~/.config/nvim/config/nvim_cmp.lua
" lsp config, keymaps
source ~/.config/nvim/config/lsp.lua
"source ~/.config/nvim/config/compe.lua
source ~/.config/nvim/config/treesitter.lua
source ~/.config/nvim/config/telescope-config.lua
source ~/.config/nvim/config/telescope.lua
source ~/.config/nvim/config/comment_nvim.lua

"source ~/.config/nvim/config/nvim_completion.vim
" should be in lua, but autocmd has no interface yet https://github.com/neovim/neovim/pull/12378

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


lua << EOF
  require("trouble").setup {
      signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
        auto_open = true,
        auto_close = true,
        use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
        mode = "document_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
        height = 5,
  }

-- set regular nvim lsp signs as well
vim.fn.sign_define("LspDiagnosticsSignError",
    {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "﫠"})
EOF
syntax on


let g:neovide_refresh_rate=140
let g:neovide_cursor_animation_length=0.05
set guifont=DejaVu_Sans_Mono:h10


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

