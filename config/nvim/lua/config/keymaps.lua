local wk = require("which-key")
wk.setup()

-- Modes
--  normal-mode       "n"
--  insert-mode       "i"
--  visual-mode       "v"
--  visual_block_mode "x"
--  term-mode         "t"
--  command-mode      "c"
wk.add({
	{ "<c-h>",         "<cmd>wincmd h<CR>",                                           desc = "Move left buffer",  remap = false, mode = "n" },
	{ "<c-j>",         "<cmd>wincmd j<CR>",                                           desc = "Move down buffer",  remap = false, mode = "n" },
	{ "<c-k>",         "<cmd>wincmd k<CR>",                                           desc = "Move up buffer",    remap = false, mode = "n" },
	{ "<c-l>",         "<cmd>wincmd l<CR>",                                           desc = "Move right buffer", remap = false, mode = "n" },
	{ "<leader>ca",    "<cmd>lua vim.lsp.buf.code_action()<CR>",                      desc = "Code actions",      remap = false, mode = "n" },
	{ "<leader>ff",    "<cmd>Telescope find_files<CR>",                               desc = "Find file...",      remap = false, mode = "n" },
	{ "<leader>fg",    "<cmd>Telescope live_grep<CR>",                                desc = "Find file...",      remap = false, mode = "n" },
	{ "<leader>fe",    "<cmd>Telescope diagnostics<CR>",                              desc = "Diagnostics...",    remap = false, mode = "n" },
	{ "<leader><esc>", function() require("snacks").explorer() end,                   desc = "Toggle sidebar",    remap = false },
	{ "<leader>t",     "<cmd>Neotest run<CR>",                                        desc = "Run test",          remap = true,  mode = "n" },
	{ "<M-r>",         function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run test",          remap = false, mode = "n" }
})

-- Insert mode
wk.add({
	{ "jk",    "<ESC>",                     desc = "Escape",                        remap = false, mode = "i" },
	{ "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", desc = "Correct last spelling mistake", remap = false, mode = "i" }
})

-- Visual mode
wk.add({
	{ ">", ">gv", desc = "Indent One Level",  remap = false, mode = "v" },
	{ "<", "<gv", desc = "Outdent One Level", remap = false, mode = "v" },
})

vim.api.nvim_create_user_command("Q", function()
	vim.cmd("qa!")
end, {})

vim.api.nvim_create_user_command("QW", function()
	vim.cmd("wqa!")
end, {})

vim.api.nvim_create_user_command("Notifications", function()
	Snacks.notifier.show_history()
end, {})

vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format({ async = true })
end, {})


