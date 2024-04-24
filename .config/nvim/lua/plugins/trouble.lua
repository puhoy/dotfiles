return {
	"folke/trouble.nvim",
	lazy = false,
	config = function()
		require("trouble").setup {
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠"
			},
			auto_open = true,
			auto_close = true,
			use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
			mode = "document_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
			height = 5,
		}
	end
}
