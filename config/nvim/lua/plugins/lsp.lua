local function sklsp_register_cap()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	return capabilities
end

local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = bufnr,
	callback = function() vim.lsp.buf.format() end,
	group = format_sync_grp,
})

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local configs = require "lspconfig.configs"
		local util = require 'lspconfig.util'
		configs["talktalk"] = {
			default_config = {
				cmd = { vim.fn.expand('$HOME/apps/talk/target/debug/talk'), 'lsp' },
				cmd_env = { RUST_BACKTRACE = "1" },
				root_dir = util.root_pattern("*.tlk"),
				filetypes = { "talktalk" },
			},
		}

		-- Create an event handler for the FileType autocommand
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'talktalk',
			callback = function(args)
				vim.lsp.start({
					name = 'talktalk',
					cmd = { vim.fn.expand('$HOME/apps/talk/target/debug/talk'), 'lsp' },
					cmd_env = { RUST_BACKTRACE = 1 },
					-- Set the "root directory" to the parent directory of the file in the
					-- current buffer (`args.buf`) that contains either a "setup.py" or a
					-- "pyproject.toml" file. Files that share a root directory will reuse
					-- the connection to the same LSP server.
					root_dir = vim.fs.root(args.buf, { '*.tlk' }),
				})
			end,
		})

		-- we're using rustaceanvim, so we skip this one
		--lspconfig.rust_analyzer.setup {}

		vim.lsp.enable("ruby_lsp")
		vim.lsp.enable("yamlls")
		vim.lsp.enable("asm_lsp")
		vim.lsp.enable("hls.setup")
		vim.lsp.enable("gopls.setup")

		vim.lsp.config("sourcekit", {
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
		})
		vim.lsp.enable("sourcekit")

		vim.lsp.config("clangd",  {
			on_attach =
					function(client)
						client.server_capabilities.semanticTokensProvider = nil
					end,
		})
		vim.lsp.enable("clangd")

		vim.lsp.config("tl_ls", {
			capabilities = {
				textDocument = {
					completion = {
						completionItem = {
							snippetSupport = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("tl_ls")

		vim.lsp.config("lua_ls", {
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
		})
		vim.lsp.enable("lua_ls")

		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP Actions',
			callback = function(args)
				-- Once we've attached, configure the keybindings
				local wk = require('which-key')
				wk.add({
					mode = 'n',
					silent = true,
					{ "gd",        vim.lsp.buf.definition,   desc = "LSP go to definition" },
					{ "g[",        vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
					{ "g]",        vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
					{ "<leader>h", vim.lsp.buf.hover,        desc = "Document symbol" }
				})
			end,
		})
	end


}
