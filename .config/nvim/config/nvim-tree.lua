-- following options are the default
require'nvim-tree'.setup {
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = true,
  -- show lsp diagnostics in the signcolumn
  diagnostics     = {
      enable = true,
  },
  prefer_startup_root = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,

    -- update root when changing to a file outside workdir
    update_root = true,

    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  filters = {
    custom = {
        '__pycache__',
    },
  },
  renderer = {
    highlight_opened_files = 'all',
    highlight_modified = 'all'
  },
}

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
