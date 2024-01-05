return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    config = true,
  },
  -- The plugin can make jk to escape better.
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin makes start screen beautiful.
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
  },
  -- The plugin can show keybindings better.
  {
    "folke/which-key.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin can auto pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  }
}
