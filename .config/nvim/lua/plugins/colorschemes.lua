return {
	{
		"ellisonleao/gruvbox.nvim",
		branch = "main",
		config = function()
			require("gruvbox").setup({
				strikethrough = true,
			})
		end,
	},
	{
		-- ellisonleao/gruvbox has problems with strike-through in markdown
		"sainnhe/gruvbox-material",
		config = function()
			vim.background = "dark"
			vim.g.gruvbox_material_foreground = 'original'
			vim.g.gruvbox_material_statusline_style = 'original'
			vim.g.gruvbox_material_background = 'hard'
			-- vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_ui_contrast = 'high'

			-- vim.g.gruvbox_material_colors_override = {
			-- 	markbg1 = { "#2e1a1a", "52" }, -- Adjusted color code for #2e1a1a
			-- 	markbg2 = { "#332616", "94" }, -- Adjusted color code for #332616
			-- 	markbg3 = { "#3a3020", "100" }, -- Adjusted color code for #3a3020
			-- 	markbg4 = { "#243218", "22" }, -- Adjusted color code for #243218
			-- 	markbg5 = { "#1b2926", "23" }, -- Adjusted color code for #1b2926
			-- 	markbg6 = { "#2e1a20", "52" }, -- Adjusted color code for #2e1a20
			-- }
			--
			-- vim.api.nvim_create_autocmd("ColorScheme", {
			-- 	group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
			-- 	pattern = "gruvbox-material",
			-- 	callback = function()
			-- 		local config = vim.fn["gruvbox_material#get_configuration"]()
			-- 		local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground,
			-- 			config.colors_override)
			-- 		local set_hl = vim.fn["gruvbox_material#highlight"]
			-- 		set_hl("RenderMarkdownH1Bg", palette.none, palette.markbg1)
			-- 		set_hl("RenderMarkdownH2Bg", palette.none, palette.markbg2)
			-- 		set_hl("RenderMarkdownH3Bg", palette.none, palette.markbg3)
			-- 		set_hl("RenderMarkdownH4Bg", palette.none, palette.markbg4)
			-- 		set_hl("RenderMarkdownH5Bg", palette.none, palette.markbg5)
			-- 		set_hl("RenderMarkdownH6Bg", palette.none, palette.markbg6)
			-- 	end,
			-- })
		end
	},
	{
		"srcery-colors/srcery-vim",
		config = function()
			-- has no effect?
			-- vim.g.srcery_italic = 1
			-- vim.g.srcery_italic_types = 1
		end,
	},
	"ntk148v/komau.vim",
	"rebelot/kanagawa.nvim",
	"https://git.sr.ht/~romainl/vim-bruin",
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		-- config = function()
		--     vim.g.zenbones_darken_comments = 45
		--     vim.cmd.colorscheme('zenbones')
		-- end
	},
	{
		'kvrohit/rasmus.nvim',
		config = function()
			vim.g.rasmus_italic_keywords = true
			vim.g.rasmus_variant = 'monochrome' -- 'dark'
			vim.g.bold_variables = true
		end
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_ui_contrast = "high"
			vim.g.everforest_current_word = 'italic'
		end,
	},
	{
		"m15a/nvim-srcerite",
		dependencies = {
			'Iron-E/nvim-highlite'
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
}
