return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = "all", -- "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				highlight = {
					enable = true, -- false will disable the whole extension
				},
			}
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			{
				-- breadcrumbs
				"SmiteshP/nvim-navic",
			},

			{
				"neovim/nvim-lspconfig",
				lazy = false,
			},
			{
				"williamboman/mason.nvim",
				lazy = false,
			},
			{
				"mfussenegger/nvim-lint",
				lazy = false,
				config = function()
					require('lint').linters_by_ft = {
						python = { 'mypy' },
						puppet = { 'puppet-lint' },
					}
					vim.api.nvim_create_autocmd({
						"BufEnter",
						"InsertLeave",
						"BufWritePost",
						"FocusLost",
					}, {
						callback = function()
							require("lint").try_lint()
						end,
					})
				end
			},
			{
				-- formatter
				"stevearc/conform.nvim",
				event = { "BufReadPre", "BufNewFile" },
				config = function()
					local conform = require("conform")
					conform.setup({
						formatters_by_ft = {
							python = { "black" },
							ruby = { "ruby-lsp" },
							puppet = { "puppet-lint" },
						},
					})
					vim.keymap.set({ "n", "v" }, "<F3>", function()
						conform.format({
							lsp_fallback = true,
							async = false,
							timeout_ms = 500,
						})
					end, { desc = "Format file or range (in visual mode)" })
				end,
			},
		},
		config = function()
			local navic = require("nvim-navic")
			-- silence "doesnt support document symbols"
			vim.g.navic_silence = true

			require("mason").setup()
			-- lsp server setup

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local on_attach = function(client, bufnr)
				-- setup breadcrumbs
				navic.attach(client, bufnr)

				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				--Enable completion triggered by <c-x><c-o>
				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				local opts = {
					noremap = true, silent = true
				}

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
					opts)
				buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
				buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
				buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
				buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
				buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
				-- buf_set_keymap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
			end

			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup { on_attach = on_attach }
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				--["rust_analyzer"] = function ()
				--    require("rust-tools").setup {}
				--end
				--
				--// not working?
				-- ["ansible"] = function()
				-- require("ansible").setup({
				--   filetypes = { "yaml", "yml", "ansible" },
				--   root_dir = lspconfig.util.root_pattern("roles", "playbooks")
				-- })
				-- end
			}
		end
	},
}
