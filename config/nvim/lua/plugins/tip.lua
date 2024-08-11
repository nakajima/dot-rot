-- Lazy.nvim
return {
  "TobinPalmer/Tip.nvim",
	"rcarriga/nvim-notify",
  event = "VimEnter",
  init = function()
		require("notify").setup {}
    require("tip").setup({
      seconds = 2,
      title = "Tip!",
      url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
    })
  end,
}
