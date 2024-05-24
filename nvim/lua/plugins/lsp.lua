return {
  -- The plugin can setup lsp and lazy start server.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      -- The plugin make lsp experience better.
      "nvimdev/lspsaga.nvim",
    },
    event = "BufReadPost",
    opts = {
      servers = {
        "lua_ls",
        "sourcekit",
        "rust_analyzer",
      },
      signs = {
        Error = require("constants.icons").close,
        Warn = require("constants.icons").warning,
        Hint = require("constants.icons").lightbulb,
        Info = require("constants.icons").info,
      },
      lspsaga = {},
    },
    config = function(_, opts)
      -- Watch lsp attach event to set keymap and config plugin.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local keymap_set = require("utils").keymap_set
          keymap_set(
            "n",
            "<leader>cl",
            "<CMD>LspInfo<CR>",
            { desc = "[C]urrent [L]sp info" }
          )
          keymap_set(
            "n",
            "gh",
            "<CMD>Lspsaga hover_doc<CR>",
            { desc = "Hover Documentation" }
          )
          keymap_set(
            "n",
            "gr",
            "<CMD>Telescope lsp_references<CR>",
            { desc = "[g]o to [r]eferences" }
          )
          keymap_set(
            "n",
            "gd",
            "<CMD>Telescope lsp_definitions<CR>",
            { desc = "[g]o to [d]efinitions" }
          )
          keymap_set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { desc = "[g]o to [D]eclaration" }
          )
          keymap_set(
            "n",
            "gI",
            "<CMD>Telescope lsp_implementations<CR>",
            { desc = "[g]o to [I]mplementations" }
          )
          keymap_set(
            "n",
            "gy",
            "<CMD>Telescope lsp_type_definitions<CR>",
            { desc = "[g]o to t[y]pe definitions" }
          )
          keymap_set(
            "n",
            "<leader>ca",
            "<CMD>Lspsaga code_action<CR>",
            { desc = "[c]ode [a]ction" }
          )
          keymap_set(
            "n",
            "<leader>cr",
            "<CMD>Lspsaga rename<CR>",
            { desc = "[c]ode [r]ename" }
          )
        end,
      })
      require("neodev").setup()
      require("lspsaga").setup(opts.lspsaga)
      for name, icon in pairs(opts.signs) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(
          name,
          { text = icon, texthl = name, linehl = "", numhl = name }
        )
      end
      for _, server in ipairs(opts.servers) do
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
}
