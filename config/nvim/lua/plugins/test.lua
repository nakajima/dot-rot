return {
	"vim-test/vim-test",
	config = function()
		vim.g['test#strategy'] = 'neovim'
		vim.g['test#neovim#start_normal'] = '1'
	end,
}
