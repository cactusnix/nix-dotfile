return {
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = {
      events = { "InsertLeave", "BufReadPost", "BufWritePost" },
      linters_by_ft = {
        lua = { "lua_lint" },
      },
      linters = function()
        return {
          lua_lint = require("langs.linters.luacheck"),
        }
      end,
    },
    config = function(_, opts)
      local lint = require("lint")
      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          lint.try_lint()
        end,
      })
      lint.linters = opts.linters()
      lint.linters_by_ft = opts.linters_by_ft
    end,
  },
}
