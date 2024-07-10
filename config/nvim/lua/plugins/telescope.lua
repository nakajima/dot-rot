return {
	'nvim-telescope/telescope.nvim',
	"nvim-telescope/telescope-frecency.nvim",
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
    require("telescope").load_extension "frecency"
  end,
}
