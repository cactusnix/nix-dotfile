return {
  -- The plugin can setup lsp and lazy start server.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      -- The plugin will show lsp process.
      "j-hui/fidget.nvim",
      -- The plugin make lsp experience better.
      "nvimdev/lspsaga.nvim",
    },
    event = "BufReadPre",
    opts = {
      servers = {
        "lua_ls",
      },
      fidget = {},
      lspsaga = {},
    },
    config = function(_, opts)
      require("fidget").setup(opts.fidget)
      require("neodev").setup()
      require("lspsaga").setup(opts.lspsaga)
      for _, server in ipairs(opts.servers) do
        require("lspconfig")[server].setup({})
        -- Watch lsp attach event to set keymap.
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local keymap_set = require("utils").keymap_set
            keymap_set(
              "n",
              "<leader>cl",
              "<CMD>LspInfo<CR>",
              { desc = "[C]urrent [L]sp info" }
            )
            keymap_set(
              "n",
              "K",
              "<CMD>Lspsaga hover_doc<CR>",
              { desc = "Hover Documentation" }
            )
          end,
        })
      end
    end,
  },
}
