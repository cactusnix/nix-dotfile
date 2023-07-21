return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
  },
  opts = {
    mason = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    languages = {
      {
        name = "lua",
        lsp = "lua_ls",
        server = "lua-language-server",
        format = "stylua",
        config = require("lsp.lua"),
      },
      {
        name = "swift",
        lsp = "sourcekit",
        server = "sourcekit-lsp",
        format = "swift_format",
        lint = "swiftlint",
        config = require("lsp.swift"),
      },
      {
        name = "json",
        lsp = "jsonls",
        server = "json-lsp",
        format = "prettier",
      },
    },
  },
  config = function(_, opts)
    require("neodev").setup()
    local lsp_configs = require("lspconfig")
    for _, it in ipairs(opts.languages) do
      -- TODO use better way to do this
      if lsp_configs[it["lsp"]] then
        lsp_configs[it["lsp"]].setup(it["config"] and it["config"] or {})
      end
    end
    require("mason").setup(opts.mason)
  end,
}
