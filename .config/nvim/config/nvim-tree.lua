-- following options are the default
require'nvim-tree'.setup({
  filters = {
    custom = {
        '__pycache__',
    },
  },
  renderer = {
    highlight_opened_files = 'all',
    highlight_modified = 'all'
  },
})

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
