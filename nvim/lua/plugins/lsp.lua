local mason_langs, custom_langs, other_packages =
    {
      {
        name = "lua",
        lsp = "lua_ls",
        ensure_installed = { "lua-language-server", "stylua" },
        config = require("lsp.lua"),
      },
      {
        name = "json",
        lsp = "jsonls",
        ensure_installed = { "json-lsp" },
      },
    }, {
      {
        name = "swift",
        lsp = "sourcekit",
        -- server = "sourcekit-lsp",
        -- format = "swift_format",
        -- lint = "swiftlint",
        config = require("lsp.swift"),
      },
    }, { "prettier" }

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      cmd = "Mason",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
      config = function(_, opts)
        require("mason").setup(opts)
        local mason_registry = require("mason-registry")
        local function install_packages(packages)
          for _, package_name in ipairs(packages) do
            local package = mason_registry.get_package(package_name)
            if not package:is_installed() then
              package:install()
            end
          end
        end
        install_packages(other_packages)
        for _, it in ipairs(mason_langs) do
          install_packages(it.ensure_installed)
        end
      end,
    },
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      config = true,
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
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
    require("neodev").setup()
    local lsp_configs = require("lspconfig")
    for _, it in ipairs(mason_langs) do
      local lsp, config = it.lsp, it.config and it.config or {}
      vim.tbl_get(lsp_configs, lsp).setup(config)
    end
  end,
}
