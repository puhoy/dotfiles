local map = vim.api.nvim_set_keymap


-- Mappings.
local opts = { noremap=true, silent=true }
map('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)

map('n', "gs", '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)

-- broken
--"nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

map('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

-- show
map('n', '<leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
-- only show diagnostic if cursor is over the area
map('n', '<leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
