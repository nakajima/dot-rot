return {
  "mg979/vim-visual-multi",
  branch = "master",
  keys = {
    { "<C-n>", mode = { "n", "v" } }, -- select word / next occurrence
    { "<C-p>", mode = { "n", "v" } }, -- select previous occurrence
    { "<C-x>", mode = { "n", "v" } }, -- skip occurrence
  },
}
