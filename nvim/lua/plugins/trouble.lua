return {
  "folke/trouble.nvim",
  event = "LspAttach",
  config = function()
    require("trouble").setup()
  end,
}
