return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local get_keymap_opts = require("utils.opts").get_keymap_opts
    keymap(
      "n",
      "<C-n>",
      "<cmd> NvimTreeToggle <CR>",
      get_keymap_opts("Toggle nvim tree")
    )
    keymap(
      "n",
      "<leader>e",
      "<cmd> NvimTreeFocus <CR>",
      get_keymap_opts("Foucs nvim tree")
    )
    require("nvim-tree").setup()
  end,
}
