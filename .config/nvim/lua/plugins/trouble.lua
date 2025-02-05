return {
	"folke/trouble.nvim",
	lazy = false,
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
	config = function()
		require("trouble").setup {
			modes = {
				diagnostic = {
					-- auto_open = true,
				},
			},
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠"
			},
			use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
			mode = "document_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
			height = 5,
		}
	end
}
