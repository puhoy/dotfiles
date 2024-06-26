return {
	-- " git commands in vim
	"tpope/vim-fugitive",

	-- " diff
	"sindrets/diffview.nvim",

	-- "vim-airline/vim-airline",
	-- "vim-airline/vim-airline-themes",

	-- " fuzzy finder
	"nvim-lua/plenary.nvim",

	-- " pgp
	"jamessan/vim-gnupg",

	-- " treesitter completion source
	"nvim-treesitter/completion-treesitter",
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			local cfg = {
				floating_window = true,
				hint_enable = false,
			}
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
