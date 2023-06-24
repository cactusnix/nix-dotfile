vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = require("constants.options").KEY_MAP_OPTS

keymap("i", "ii", "<ESC>", opts)
keymap("n", "q", ":q<CR>", opts)
keymap("n", "qf", ":q!<CR>", opts)
keymap("n", "w", ":w<CR>", opts)
keymap("n", "qa", ":wqall<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
