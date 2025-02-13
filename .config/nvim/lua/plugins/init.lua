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

	"kyazdani42/nvim-web-devicons",
	"chrisbra/csv.vim",
	"gpanders/editorconfig.nvim",
	"folke/zen-mode.nvim",
	"73/vim-klog",

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
	{
		"rickhowe/wrapwidth",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.md" },
				command = "Wrapwidth 80",
			})
		end
	},
	-- 	{
	-- 	"preservim/vim-markdown",
	-- 	dependencies = { 'godlygeek/tabular' },
	-- 	config = function()
	-- 		vim.g.vim_markdown_folding_disabled = 1
	-- 		vim.g.vim_markdown_folding_disabled = 1
	-- 		vim.g.vim_markdown_toc_autofit = 1
	-- 	end
	-- }
}
