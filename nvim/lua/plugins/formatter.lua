return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format bufer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true, -- Use lsp format as fallback.
        timeout_ms = 500,
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
