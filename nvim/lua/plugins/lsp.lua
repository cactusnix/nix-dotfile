return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",
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
        server = "lua_ls",
        format = "stylua",
        config = require("lsp.lua"),
      },
      {
        name = "swift",
        lsp = "sourcekit",
        server = "sourcekit",
        format = "swift_format",
        lint = "swiftlint",
        config = require("lsp.swift"),
      },
      {
        name = "json",
        lsp = "jsonls",
        server = "jsonls",
        format = "prettier",
      },
    },
  },
  config = function(_, opts)
    local lsp_configs = require("lspconfig")
    local mason_registry = require("mason-registry")
    local servers = {}
    local formats = {}
    local lints = {}
    for i, it in ipairs(opts.languages) do
      formats[i] = it["format"]
      lints[i] = it["lint"]
      -- if mason_registry.has_package("swift") then
      --   servers[i] = it["server"]
      -- end
      -- TODO use better way to do this
      if lsp_configs[it["lsp"]] then
        lsp_configs[it["lsp"]].setup(it["config"] and it["config"] or {})
      end
    end
    print(mason_registry.has_package("lua-language-server"))
    -- for i, value in ipairs(mason_registry.get_all_packages()) do
    --   print(value)
    -- end
    require("mason").setup(opts.mason)
    require("mason-lspconfig").setup(servers)
    require("mason-null-ls").setup()
  end,
}
