return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
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
    config = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
}
