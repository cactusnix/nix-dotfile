return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      config = true,
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
    local icons = require("constants.icons")
    local diagnostic_signs = {
      {
        name = "DiagnosticSignError",
        text = icons.diagnostics.error,
      },
      {
        name = "DiagnosticSignWarn",
        text = icons.diagnostics.warn,
      },
      {
        name = "DiagnosticSignHint",
        text = icons.diagnostics.hint,
      },
      {
        name = "DiagnosticSignInfo",
        text = icons.diagnostics.info,
      },
    }
    for _, sign in ipairs(diagnostic_signs) do
      vim.fn.sign_define(
        sign.name,
        { texthl = sign.name, text = sign.text, numhl = sign.name }
      )
    end
    local languages, mason_config = opts.languages, opts.mason
    require("neodev").setup()
    require("mason").setup(mason_config)
    local lsp_configs = require("lspconfig")
    for _, it in ipairs(languages) do
      local lsp, config = it.lsp, it.config and it.config or {}
      local success, _ =
          pcall(require, "lspconfig.server_configurations." .. lsp)
      if success then
        vim.tbl_get(lsp_configs, lsp).setup(config)
      end
    end
  end,
}
