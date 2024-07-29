local function sklsp_register_cap()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return capabilities
end

return {
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

		lspconfig.clangd.setup {
			on_attach =
					function(client)
						client.server_capabilities.semanticTokensProvider = nil
					end,
		}

		lspconfig.tsserver.setup {
			capabilities = {
				textDocument = {
					completion = {
						completionItem = {
							snippetSupport = true,
						},
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

		lspconfig.lua_ls.setup {
			settings = {
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
