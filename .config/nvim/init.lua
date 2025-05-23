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
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	-- checker = { enabled = true },
	change_detection = { notify = false }
})

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
-- https://gist.github.com/haggen/2fd643ea9a261fea2094?permalink_comment_id=4496230#gistcomment-4496230
vim.api.nvim_create_user_command("Random", function(details)
		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		local sets = {{97, 122}, {65, 90}, {48, 57}} -- a-z, A-Z, 0-9
		local r = ""
		length = tonumber(details.fargs[1])
		for i = 1, length do
			math.randomseed(os.clock() ^ 5)
			local charset = sets[ math.random(1, #sets) ]
			r = r .. string.char(math.random(charset[1], charset[2]))
		end
		print(r)
		vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { r })
	end,
	{nargs = 1,})

-- ":call setline(line('.'), getline(line('.')) .  system(\"strings -n 1 < /dev/urandom |  tr -dc 'a-zA-Z0-9' | fold -w \" . <f-args> . \" |  head -n 1 | tr -d '\n'\") ",
	-- { nargs = 1,})
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
