vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local get_keymap_opts = require("utils.opts").get_keymap_opts

keymap("n", "<C-s>", ":w<CR>", get_keymap_opts())

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", get_keymap_opts())
keymap("n", "<C-j>", "<C-w>j", get_keymap_opts())
keymap("n", "<C-k>", "<C-w>k", get_keymap_opts())
keymap("n", "<C-l>", "<C-w>l", get_keymap_opts())

-- Plugins
keymap(
  "n",
  "<leader>e",
  ":NvimTreeToggle<CR>",
  get_keymap_opts("Toggle file explorer")
)
