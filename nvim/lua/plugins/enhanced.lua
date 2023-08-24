return {
  {
    "folke/flash.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "folke/persistence.nvim",
    config = true,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>tt",
        "<cmd>TroubleToggle<cr>",
        desc = "Trouble Toggle",
      },
    },
    config = true,
  },
  -- Display real-time color plugin
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  -- Surround enhanced plugin
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = true,
  },
}
