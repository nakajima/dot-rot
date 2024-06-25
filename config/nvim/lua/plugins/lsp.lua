return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.sourcekit.setup {
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			}

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = "LSP Actions",
				callback = function(args)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup { settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
							-- Setup your lua path
							path = vim.split(package.path, ';')
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim' },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false, -- Avoid the prompt about third party files
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			}
		end
	}
}
