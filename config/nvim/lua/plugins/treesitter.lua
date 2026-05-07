return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "OXY2DEV/markview.nvim" },
    lazy = false,
    opts = {
      ensure_installed = {
        "c", "llvm", "lua", "vim", "vimdoc", "query",
        "elixir", "heex", "javascript", "html"
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
    },
  },
}
