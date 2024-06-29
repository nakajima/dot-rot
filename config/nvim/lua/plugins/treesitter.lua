return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "swift", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = false },
        auto_install = true,
        modules = {},
        ignore_install = {},
      })

      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.talktalk = {
        install_info = {
          url = "~/apps/talktalk/tree-sitter-talktalk", -- local path or git repo
          files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "main", -- default branch in case of git repo if different from master
          generate_requires_npm = true,
          requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
        },
        filetype = "tlk", -- if filetype does not match the parser name
      }
    end
  }
}
