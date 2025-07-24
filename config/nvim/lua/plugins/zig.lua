return {
	"jinzhongjia/zig-lamp",
	event = "VeryLazy",
	build = ":ZigLamp build sync",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
	},
	init = function()
		-- Configuration options (all optional)

		-- Timeout in milliseconds for automatic ZLS installation
		-- Set to nil to disable auto-install
		vim.g.zig_lamp_zls_auto_install = nil

		-- Fallback to system ZLS if local version not found
		-- Set to any non-negative value to enable
		vim.g.zig_lamp_fall_back_sys_zls = nil

		-- LSP configuration options passed to lspconfig
		vim.g.zig_lamp_zls_lsp_opt = {}

		-- UI customization
		vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
		vim.g.zig_lamp_zig_fetch_timeout = 5000
	end,
}
