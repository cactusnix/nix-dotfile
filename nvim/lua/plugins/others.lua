return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    opt = {},
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    config = function()
      require("oil").setup()
    end
  },
  -- The plugin can make jk to escape better.
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end
  },
  -- The plugin can look startup time.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },
  -- The plugin makes start screen beautiful.
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup()
    end
  }
}
