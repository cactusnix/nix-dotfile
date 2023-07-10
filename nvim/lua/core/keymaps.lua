vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = require("constants.options").KEYMAP_OPTS

keymap("n", "<C-s>", ":w<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Plugins
