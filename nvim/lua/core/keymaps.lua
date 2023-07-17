vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local get_keymap_opts = require("utils.opts").get_keymap_opts

-- Insert Mode
keymap("i", "<C-b>", "<Esc>^i", get_keymap_opts("Beginning of line"))
keymap("i", "<C-e>", "<End>", get_keymap_opts("End of line"))
keymap("i", "<C-h>", "<Left>", get_keymap_opts("Cursor move left"))
keymap("i", "<C-j>", "<Down>", get_keymap_opts("Cursor move down"))
keymap("i", "<C-k>", "<Up>", get_keymap_opts("Cursor move up"))
keymap("i", "<C-l>", "<Right>", get_keymap_opts("Cursor move right"))

-- Normal Mode
keymap("n", "<C-s>", "<cmd> w <CR>", get_keymap_opts("Save current file"))
keymap("n", "<C-h>", "<C-w>h", get_keymap_opts("Window cursor move left"))
keymap("n", "<C-j>", "<C-w>j", get_keymap_opts("Window cursor move down"))
keymap("n", "<C-k>", "<C-w>k", get_keymap_opts("Window cursor move up"))
keymap("n", "<C-l>", "<C-w>l", get_keymap_opts("Window cursor move right"))
