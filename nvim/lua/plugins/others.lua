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
    config = true,
  },
  -- The plugin can look startup time.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  -- The plugin makes start screen beautiful.
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
  },
  -- The plugin can show keybindings better.
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = true,
  },
}
