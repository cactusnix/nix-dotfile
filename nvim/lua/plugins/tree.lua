return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
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
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup()
  end,
}
