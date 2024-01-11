return {
  -- The plugin can setup lsp and lazy start server.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
    },
    event = "BufReadPre",
    opts = {
      servers = {
        "lua_ls",
      },
    },
    config = function(_, opts)
      require("neodev").setup()
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
            keymap_set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
          end,
        })
      end
    end,
  },
}
