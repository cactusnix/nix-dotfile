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
  -- It can be replaced by nvim-autopairs that has more feature.
  -- But now, I only need simple one.
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "echasnovski/mini.comment",
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
}
