
call plug#begin()
" file tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " needs web-devicons

Plug 'folke/which-key.nvim'

" show git changes
"Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'
" git commands in vim
Plug 'tpope/vim-fugitive'

" diff
Plug 'sindrets/diffview.nvim'

" display buffers as 'tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme
Plug 'ellisonleao/gruvbox.nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim'

" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" pgp
Plug 'jamessan/vim-gnupg'

" lsp autocomplete
"Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" treesitter completion source
Plug 'nvim-treesitter/completion-treesitter'

" install languageservers
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ray-x/lsp_signature.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" show diagnostics in virtual text
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

Plug 'chrisbra/csv.vim'

Plug 'gpanders/editorconfig.nvim'

Plug 'numToStr/Comment.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

Plug 'folke/which-key.nvim'

Plug 'folke/zen-mode.nvim'

" icon chooser
Plug 'nvim-telescope/telescope-symbols.nvim'

" show colors
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

let mapleader=","

lua <<end
require("lsp_lines").setup()
end

lua <<end
require("diffview").setup({
  view = {
    -- Configure the layout and behavior of different types of views.
    -- Available layouts:
    --  'diff1_plain'
    --    |'diff2_horizontal'
    --    |'diff2_vertical'
    --    |'diff3_horizontal'
    --    |'diff3_vertical'
    --    |'diff3_mixed'
    --    |'diff4_mixed'
    -- For more info, see ':h diffview-config-view.x.layout'.
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      layout = "diff3_mixed",
	  disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
      winbar_info = true,
    },
  },
})
end


lua <<end
require('gitsigns').setup {
	_signs_staged_enable = true,
    yadm= {
        enable = true,
    },
}
end

lua<<end
vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
end

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

command! Date :r!date "+\%F \%T"

source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/nvim-tree.vim
source ~/.config/nvim/config/nvim-tree.lua
source ~/.config/nvim/config/signify.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/wiki.vim

source ~/.config/nvim/config/nvim_cmp.lua
" lsp config, keymaps
source ~/.config/nvim/config/lsp.lua
source ~/.config/nvim/config/treesitter.lua
source ~/.config/nvim/config/telescope-config.lua
source ~/.config/nvim/config/telescope.lua
source ~/.config/nvim/config/comment_nvim.lua

source ~/.vimrc

source ~/.config/nvim/config/main.vim

lua << EOF
vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF

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
        auto_open = false,
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

lua << EOF
vim.opt.listchars = {
  tab = '│ ',
}
vim.opt.list = true
EOF


syntax on

set guifont=DejaVu_Sans_Mono:h10


lua require'colorizer'.setup()
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

