return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"OXY2DEV/markview.nvim"
		},
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "llvm", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
				auto_install = true,
				modules = {},
				ignore_install = {},
			})
		end
	}
}
