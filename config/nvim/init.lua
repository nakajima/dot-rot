require("config.lazy")

-- Basic setup options
vim.opt.termguicolors = true
vim.cmd([[
	set autoindent
	set noexpandtab
	set tabstop=2
	set shiftwidth=2
]])

vim.cmd("map <S-Esc> :NvimTreeFocus <CR>")
vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format({ async = true })
end, {})
