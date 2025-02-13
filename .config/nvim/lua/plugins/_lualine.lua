return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			"SmiteshP/nvim-navic",
			"sainnhe/gruvbox-material",
		},
		config = function()
			local navic = require("nvim-navic")
			require("lualine").setup({
				sections = {
					lualine_a = {},
					lualine_c = {
						{
							function()
								return navic.get_location()
							end,
							cond = function()
								return navic.is_available()
							end
						},
					}
				},
				winbar = {
					lualine_c = {
						{
							'filename',
							path = 1,
						},
					},

				},
				options = {
					theme = 'gruvbox-material'
				}
			})
		end,
	},
}
