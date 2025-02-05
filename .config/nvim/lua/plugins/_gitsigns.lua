return {
	-- " show git changes
	-- ""mhinz/vim-signify"
	"lewis6991/gitsigns.nvim",
	config = function()
		require('gitsigns').setup {
			signs_staged_enable = true,
		}
	end
}
