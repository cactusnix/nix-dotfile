return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local opts = require("constants.options").KEYMAP_OPTS
    keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
    require("lspsaga").setup()
  end,
}
