local opt = vim.opt

opt.termguicolors = true

-- Everyone says to do this lol
opt.backspace = {"start", "indent", "eol"}

opt.autoindent = true
opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.modeline = true
opt.filetype = 'on'

vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files<cr>")
vim.cmd("nnoremap <cmd>Fs <cmd>!swiftformat .<cr>")

vim.diagnostic.config({ virtual_text = true })

local state = vim.fn.stdpath("state")           -- ~/.local/state/nvim
local backupdir = state .. "/backup//"
local undodir   = state .. "/undo//"
vim.fn.mkdir(backupdir, "p")
vim.fn.mkdir(undodir,   "p")
vim.opt.backup       = true      -- keep a pre-save copy: file~
vim.opt.writebackup  = true      -- temp file while writing (safer)
vim.opt.undofile     = true      -- persistent undo on disk
vim.opt.backupdir    = backupdir
vim.opt.undodir      = undodir

