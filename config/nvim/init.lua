require("config.lazy")

-- Basic setup options
vim.opt.termguicolors = true
vim.cmd([[
	set autoindent
	set noexpandtab
	set tabstop=2
	set shiftwidth=2
	set number
]])

vim.cmd("map <S-Esc> :NvimTreeFocus <CR>")
vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format({ async = true })
end, {})

vim.api.nvim_create_user_command("QQ","qa!", {})

-- Keybinding for jumping to definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Function to reload Neovim configuration
function ReloadConfig()
  -- Save the current buffer
  vim.cmd('wa')

  -- Clear Lua cache for all loaded modules
  for name, _ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') or name:match('^lspconfig') then
      package.loaded[name] = nil
    end
  end

  -- Reload the init.lua file
  dofile(vim.env.MYVIMRC)

  -- Print a message to confirm reloading
  print("Configuration reloaded: "..vim.env.MYVIMRC)
end
vim.api.nvim_create_user_command('ReloadConfig', 'lua ReloadConfig()', {})
