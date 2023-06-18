local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- dependencies for other plugins
  "MunifTanjim/nui.nvim", -- UI Component Libray
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "akinsho/bufferline.nvim",
  "folke/todo-comments.nvim",
  {
    "nvim-lualine/lualine.nvim", -- status line
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
  "nvim-treesitter/nvim-treesitter", -- highlight
  {
    "nvim-tree/nvim-tree.lua",       -- file tree
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  "jose-elias-alvarez/null-ls.nvim",
  "glepnir/lspsaga.nvim",
  "lewis6991/gitsigns.nvim",
  "dstein64/vim-startuptime",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "folke/which-key.nvim",
  "glepnir/dashboard-nvim",
  "jay-babu/mason-null-ls.nvim",
  "jay-babu/mason-nvim-dap.nvim",
  "folke/trouble.nvim",
  "akinsho/toggleterm.nvim",
  "folke/noice.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
