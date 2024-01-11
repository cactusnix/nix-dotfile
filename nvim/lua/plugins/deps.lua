return {
  -- The plugin makes icon beautiful.
  {
    "nvim-tree/nvim-web-devicons",
  },
  -- The plugin is needed by other plugins to do something.
  {
    "nvim-lua/plenary.nvim",
  },
  -- The plugin makes other plugins better.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    cmd = { "TSInstall", "TSUpdate" },
    opts = {
      ensure_installed = {
        "json",
        "lua",
        "markdown",
        "markdown_inline",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
