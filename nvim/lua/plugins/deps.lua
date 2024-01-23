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
    opts = {
      ensure_installed = {
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "rust",
        "swift",
      },
      -- This is an experimental feature.
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
