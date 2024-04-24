return {
	"nvim-telescope/telescope.nvim",
	dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
	branch = '0.1.x',
	config = function(lazy, opts)
		require("telescope").setup({
			defaults = {
				layout_config = {
					--horizontal = {
					--    preview_cutoff = 5,
					--},
					vertical = {
						width = 0.5
					}
				},
				mappings = {
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
						["<c-t>"] = require("trouble.providers.telescope").open_with_trouble
					},
					n = {
						["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
						-- ["<Leader>ff"] = require("telescope").project_files
					},
				}
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					}
				}
			}
		})
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{
				"<Leader>ff",
				function()
					project_files = function()
						local opts = {} -- define here if you want to define something
						local ok = pcall(require "telescope.builtin".git_files, opts)
						if not ok then require "telescope.builtin".find_files(opts) end
					end
					project_files()
				end,
				desc = "list project files"
			},
			{
				"<Leader>fg",

				function()
					builtin.live_grep({
						layout_config = {
							vertical = { width = 0.5 } }
					})
				end
				,
				desc = "grep in files"
			},
			{
				"<Leader>fb",
				builtin.buffers,
				desc = "list buffers"
			},
		}
	end
}
