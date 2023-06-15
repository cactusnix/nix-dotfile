vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "ii", "<ESC>")
keymap.set("n", "q", ":q<CR>")
keymap.set("n", "qf", ":q!<CR>")
keymap.set("n", "w", ":w<CR>")
keymap.set("n", "qa", ":wqall<CR>")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>")
