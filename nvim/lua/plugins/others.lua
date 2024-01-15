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
    lazy = false,
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
  },
  -- The plugin show nice status line.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = true,
  },
  -- The plugin make motion nice.
  {
    "folke/flash.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin show indent blankline.
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufRead",
    config = true,
  },
  -- The plugin measure startup time, it uses vim script so maybe not need config = true.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  -- The plugin make buffer better.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<CMD>BufferLineTogglePin<CR>", desc = "[b]uffer [p]in" },
      {
        "<leader>bo",
        "<Cmd>BufferLineCloseOthers<CR>",
        desc = "[b]uffer close [o]ther",
      },
      {
        "<leader>br",
        "<CMD>BufferLineCloseRight<CR>",
        desc = "[b]uffer close to [r]ight",
      },
      {
        "<leader>bl",
        "<CMD>BufferLineCloseLeft<CR>",
        desc = "[b]uffer close to [l]eft",
      },
      { "<S-h>", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<S-l>", "<CMD>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "[b", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "]b", "<CMD>BufferLineCycleNext<CR>", desc = "Next buffer" },
    },
    config = true,
  },
  -- The plugin make ui animate better.
  {
    "echasnovski/mini.animate",
    version = false,
    event = "VeryLazy",
    config = true,
  },
}
