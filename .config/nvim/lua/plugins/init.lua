return {
	-- " git commands in vim
	"tpope/vim-fugitive",

	-- " diff
	"sindrets/diffview.nvim",

	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",


	-- " fuzzy finder
	"nvim-lua/plenary.nvim",

	-- " pgp
	"jamessan/vim-gnupg",

	-- " lsp autocomplete
	-- ""nvim-lua/completion-nvim"
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	-- " "hrsh7th/cmp-nvim-lsp-signature-help"
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	-- " treesitter completion source
	"nvim-treesitter/completion-treesitter",

	"neovim/nvim-lspconfig",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = "all", -- "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				highlight = {
					enable = true, -- false will disable the whole extension
				},
			}
		end
	},
	{
		"ray-x/lsp_signature.nvim",
		setup = function()
			require "lsp_signature".setup(cfg)
		end
	},
	"kyazdani42/nvim-web-devicons",
	"chrisbra/csv.vim",
	"gpanders/editorconfig.nvim",
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install"
	},
	"folke/zen-mode.nvim",
}