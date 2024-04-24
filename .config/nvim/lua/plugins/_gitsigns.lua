return {
	-- " show git changes
	-- ""mhinz/vim-signify"
	"lewis6991/gitsigns.nvim",
	config = function()
		require('gitsigns').setup {
			_signs_staged_enable = true, -- experimental
			yadm = {
				enable = true
			},
		}
	end
}
