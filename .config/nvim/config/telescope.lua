require("telescope").setup {
  defaults = {
    -- ....
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" }
    },
  }
}


require("telescope").project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end


vim.api.nvim_set_keymap("n", "<Leader>ff", "<CMD>lua require'telescope'.project_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fg", "<CMD>lua require'telescope.builtin'.live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", "<CMD>lua require'telescope.builtin'.buffers()<CR>", {noremap = true, silent = true})

