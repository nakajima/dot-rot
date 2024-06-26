local function sklsp_register_cap()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return capabilities
end

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
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

			lspconfig.dockerls.setup {
				settings = {
					docker = {
						workspaceFolder = {
							"docker-compose.yml",
							"Dockerfile",
						},
						languageserver = {
							formatter = {
								ignoreMultilineInstructions = true,
							},
						},
					},
				},

			}

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

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = "LSP Actions",
				callback = function(args)
					-- Once we've attached, configure the keybindings
					local wk = require('which-key')
					wk.register({
						K = { vim.lsp.buf.hover, "LSP hover info" },
						gd = { vim.lsp.buf.definition, "LSP go to definition" },
						gD = { vim.lsp.buf.declaration, "LSP go to declaration" },
						gi = { vim.lsp.buf.implementation, "LSP go to implementation" },
						gr = { vim.lsp.buf.references, "LSP list references" },
						gs = { vim.lsp.buf.signature_help, "LSP signature help" },
						gn = { vim.lsp.buf.rename, "LSP rename" },
						["[g"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
						["g]"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
					}, {
						mode = 'n',
						silent = true,
					})
				end,
			})
		end,
	},
}
