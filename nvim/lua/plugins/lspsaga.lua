return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local get_keymap_opts = require("utils.opts").get_keymap_opts
    keymap(
      "n",
      "gD",
      "<cmd> Lspsaga goto_type_definition <CR>",
      get_keymap_opts("Go to type definition")
    )
    keymap(
      "n",
      "gd",
      "<cmd> Lspsaga goto_definition <CR>",
      get_keymap_opts("Go to definition")
    )
    require("lspsaga").setup()
  end,
}
