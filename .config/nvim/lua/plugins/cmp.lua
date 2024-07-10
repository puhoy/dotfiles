-- " lsp autocomplete
return {
	-- ""nvim-lua/completion-nvim"
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-emoji",
	-- " "hrsh7th/cmp-nvim-lsp-signature-help"
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			-- Setup nvim-cmp.
			local cmp = require 'cmp'

			cmp.setup({
				snippet = {
					expand = function(args)
						-- For `vsnip` user.
						-- vim.fn["vsnip#anonymous"](args.body)

						-- For `luasnip` user.
						-- require('luasnip').lsp_expand(args.body)

						-- For `ultisnips` user.
						-- vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				mapping = {
					['<C-e>'] = cmp.mapping.close(),
					['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
					-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
					['<CR>'] = cmp.mapping.confirm({ select = false }),
				},
				preselect = cmp.PreselectMode.None,

				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'path' },
					{ name = 'emoji' },
					-- { name = 'nvim_lsp_signature_help' },
					-- For vsnip user.
					-- { name = 'vsnip' },

					-- For luasnip user.
					-- { name = 'luasnip' },

					-- For ultisnips user.
					-- { name = 'ultisnips' },

					{ name = 'buffer' },
				}
			})
		end
	}
}
