local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local find_files_opts = {
    find_command = { "rg", "--ignore","--hidden","--files prompt_prefix=🔍"}
  }
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(find_files_opts) end
end



return M




-- call via:
-- :lua require"telescope-config".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})
