return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>fc",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "[f]ormat [c]ode",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "lua_fmt" },
        swift = { "swift_format" },
      },
      format_on_save = {
        lsp_fallback = true, -- Use lsp format as fallback.
        timeout_ms = 500,
      },
      formatters = {
        lua_fmt = require("langs.formatters.stylua"),
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
