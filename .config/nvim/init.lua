local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- before lazy init
require("lazy").setup("plugins")

-- config

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		-- Enable signs
		signs = true,
		virtual_text = false,
		underline = true,
	}
)

vim.g.VM_mouse_mappings = 1
vim.cmd("nmap <A-LeftMouse> <Plug>(VM-Mouse-Cursor)")


vim.cmd("nmap gx :!open <c-r><c-a>")

vim.api.nvim_create_user_command("Date", ":r!date \"+\\%F \\%T\"", {})

vim.cmd("source ~/.config/nvim/config/nvim-tree.vim")
vim.cmd("source ~/.config/nvim/config/wiki.vim")



vim.cmd("source ~/.vimrc")
vim.cmd("source ~/.config/nvim/config/main.vim")

vim.o.timeout = true
vim.o.timeoutlen = 300


-- " open nonexistent file under cursor
vim.api.nvim_set_keymap('n', '<leader>gf', ':e <cfile><cr>', { noremap = true })

-- move through visual wrapped lines instead of real lines
vim.api.nvim_set_keymap('n', '<UP>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<DOWN>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '0', 'g0', { noremap = true })
vim.api.nvim_set_keymap('n', '$', 'g$', { noremap = true })

-- " append random alphanumeric string to current line
vim.api.nvim_create_user_command("Random",
	":call setline(line('.'), getline(line('.')) .  system(\"strings -n 1 < /dev/urandom |  tr -dc 'a-zA-Z0-9' | fold -w \" . <f-args> . \" |  head -n 1 | tr -d '\n'\") ",
	{})
-- command! -nargs=1 Random :call setline(line('.'), getline(line('.')) .  system("strings -n 1 < /dev/urandom |  tr -dc 'a-zA-Z0-9' | fold -w " . <f-args> . " |  head -n 1 | tr -d '\n'"))
-- " set working dir to current file
-- "autocmd BufEnter * silent! lcd %:p:h



-- set regular nvim lsp signs as well
vim.fn.sign_define("LspDiagnosticsSignError",
	{ text = "" })
vim.fn.sign_define("LspDiagnosticsSignWarning",
	{ text = "" })
vim.fn.sign_define("LspDiagnosticsSignInformation",
	{ text = "" })
vim.fn.sign_define("LspDiagnosticsSignHint",
	{ text = "﫠" })

vim.opt.listchars = {
	tab = '│ ',
}
vim.opt.list = true

vim.cmd("syntax on")

vim.g.guifont = "DejaVu_Sans_Mono:h10"


