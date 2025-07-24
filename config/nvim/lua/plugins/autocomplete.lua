return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets' },

	-- use a release tag to download pre-built binaries
	version = '1.*',
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = 'super-tab' },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'normal'
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = { documentation = { auto_show = true } },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}


-- lua/plugins/autocomplete.lua
-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     version = false,
--     event = "InsertEnter",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-buffer",
--     },
--     config = function()
--       local cmp = require('cmp')
--       local opts = {
--         sources = cmp.config.sources {
--           { name = "nvim_lsp", },
--           { name = "path", },
--           { name = "buffer", },
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--           ["<tab>"] = cmp.mapping(function(original)
--             print("tab pressed")
--             if cmp.visible() then
--               print("cmp expand")
--               cmp.select_next_item()
--             else
--               print("fallback")
--               original()
--             end
--           end, {"i", "s"}),
--           ["<S-tab>"] = cmp.mapping(function(original)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             else
--               original()
--             end
--           end, {"i", "s"}),
--
--         })
--       }
--       cmp.setup(opts)
--     end,
--   },
--   { "hrsh7th/cmp-nvim-lsp", lazy = true },
--   { "hrsh7th/cmp-path", lazy = true },
--   { "hrsh7th/cmp-buffer", lazy = true },
-- }
