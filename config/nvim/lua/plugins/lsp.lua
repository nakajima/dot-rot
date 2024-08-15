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

		local configs = require "lspconfig.configs"
		local util = require 'lspconfig.util'
		configs["talktalk"] = {
			default_config = {
				cmd = { vim.fn.expand('$HOME/apps/talktalk/.build/debug/talk'), 'lsp' },
				root_dir = util.root_pattern("*.tlk"),
				filetypes = { "talktalk" },
			},
		}

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

		-- Create an event handler for the FileType autocommand
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'talktalk',
			callback = function(args)
				vim.lsp.start({
					name = 'talktalk',
					cmd = { '/Users/nakajima/apps/talktalk/.build/debug/talk', 'lsp' },
					-- Set the "root directory" to the parent directory of the file in the
					-- current buffer (`args.buf`) that contains either a "setup.py" or a
					-- "pyproject.toml" file. Files that share a root directory will reuse
					-- the connection to the same LSP server.
					root_dir = vim.fs.root(args.buf, { 'basic.tlk' }),
				})
			end,
		})

		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP Actions',
			callback = function(args)
				-- Once we've attached, configure the keybindings
				local wk = require('which-key')
				wk.add({
					mode = 'n',
					silent = true,
					{ "gd", vim.lsp.buf.definition,   desc = "LSP go to definition" },
					{ "[g", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
					{ "g]", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
				})
			end,
		})
	end


}
