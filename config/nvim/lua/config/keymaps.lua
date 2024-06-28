local wk = require("which-key")
wk.setup()

-- Modes
--  normal-mode       "n"
--  insert-mode       "i"
--  visual-mode       "v"
--  visual_block_mode "x"
--  term-mode         "t"
--  command-mode      "c"

wk.register({
	["<leader>w"] = { "<cmd>w<CR>", "Save" },
	["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find file..." },
	["<c-k>"] = { "<cmd>wincmd k<CR>", "Move up buffer" },
	["<c-j>"] = { "<cmd>wincmd j<CR>", "Move down buffer" },
	["<c-h>"] = { "<cmd>wincmd h<CR>", "Move left buffer" },
	["<c-l>"] = { "<cmd>wincmd l<CR>", "Move right buffer" },
}, {
	mode = "n",
	noremap = true,
	silent = true,
})

-- Insert mode
wk.register({
  ["jk"] = { "<ESC>", "Escape" },
  ["<C-l>"] = { "<c-g>u<Esc>[s1z=`]a<c-g>u", "Correct last spelling mistake" },
}, {
  mode = "i",
  noremap = true,
  silent = true
})

-- Visual mode
wk.register({
  [">"] = { ">gv", "Indent One Level" },
  ["<"] = { "<gv", "Outdent One Level" },
}, {
  mode = "v",
  noremap = true,
  silent = true,
})

