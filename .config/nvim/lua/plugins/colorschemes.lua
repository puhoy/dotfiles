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
			vim.g.airline_theme = 'gruvbox_material'

			vim.background = "dark"
			vim.g.gruvbox_material_foreground = 'original'
			vim.g.gruvbox_material_statusline_style = 'original'
			vim.g.gruvbox_material_background = 'hard'
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_ui_contrast = 'high'
		end
	},
	"srcery-colors/srcery-vim",
	"rebelot/kanagawa.nvim",
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_ui_contrast = "high"
			vim.g.everforest_current_word = 'italic'
		end,
	},

}
