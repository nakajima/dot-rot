return {
	"gbprod/yanky.nvim",
	config = function()
		require('yanky').setup {
			picker = {
				select = {
					action = nil
				},
				telescope = {
					use_default_mappings = true,
					mappings = nil,
				},
			},
		}

		require("telescope").load_extension("yank_history")
	end
}
