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
		"sainnhe/gruvbox-material",
		config = function()
			vim.background = "dark"
			vim.g.gruvbox_material_background = 'hard'
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
