return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup()
  end,
}
