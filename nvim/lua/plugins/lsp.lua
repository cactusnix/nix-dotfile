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
    local languages = opts.languages
    for _, it in ipairs(languages) do
      local lsp, config = it.lsp, it.config and it.config or {}
      local success, _ =
          pcall(require, "lspconfig.server_configurations." .. lsp)
      if success then
        vim.tbl_get(lsp_configs, lsp).setup(config)
      end
    end
    require("mason").setup(opts.mason)
  end,
}
