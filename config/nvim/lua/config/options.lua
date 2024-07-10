local opt = vim.opt

opt.termguicolors = true

-- Everyone says to do this lol
opt.backspace = {"start", "indent", "eol"}

opt.autoindent = true
opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.modeline = true
opt.filetype = 'on'

vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <cmd>Fs <cmd>!swiftformat .<cr>")
vim.cmd("nnoremap <cmd>Q <cmd>qa<cr>")

vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format({ async = true })
end, {})


