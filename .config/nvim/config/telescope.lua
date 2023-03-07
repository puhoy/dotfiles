local actions = require "telescope.actions"

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
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                }
            }
        }
    }
})

require("telescope").project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, opts)
    if not ok then require "telescope.builtin".find_files(opts) end
end


vim.api.nvim_set_keymap("n", "<Leader>ff", "<CMD>lua require'telescope'.project_files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", "<CMD>lua require'telescope.builtin'.live_grep({layout_config={vertical={width=0.5}}})<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", "<CMD>lua require'telescope.builtin'.buffers()<CR>",
    { noremap = true, silent = true })

--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
--nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
--nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
