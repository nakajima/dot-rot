return {
	'rmagatti/auto-session',
	lazy = false,
	dependencies = {
		'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
	},
	config = function()
		require('auto-session').setup({
			auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
			auto_session_create_enabled = false,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,
			bypass_session_save_file_types = { "neo-tree" }
		})
	end,
}
