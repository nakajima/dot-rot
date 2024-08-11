return {
	'nanozuki/tabby.nvim',
	-- event = 'VimEnter', -- if you want lazy load, see below
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		-- configs...
		require('tabby').setup {}

		local wk = require("which-key")
		wk.add(
			{
				mode = "n",
				{ "<leader>t", "<cmd>tabnew<CR>",      desc = "New tab",      remap = false, mode = "n" },
				{ "<C-[>",     "<cmd>tabprevious<CR>", desc = "Previous tab", remap = false },
				{ "<C-]>",     "<cmd>tabnext<CR>",     desc = "Next tab",     remap = false }
			}
		)
	end,
}
