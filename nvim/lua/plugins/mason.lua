return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
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
    lsp = {
      ensure_installed = {
        "lua_ls",
      },
    },
    format = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts.mason)
    require("mason-lspconfig").setup(opts.lsp)
    require("mason-null-ls").setup(opts.format)
  end,
}
