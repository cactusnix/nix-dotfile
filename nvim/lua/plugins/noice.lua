return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    require("noice").setup()
    local keymap = vim.api.nvim_set_keymap
    local keymap_opts = require("constants.options").KEYMAP_OPTS
    keymap(
      "n",
      "<leader>sl",
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      keymap_opts
    )
  end,
}
