return {
  "folke/noice.nvim",
  dependencies = {
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    require("noice").setup()
  end,
}
