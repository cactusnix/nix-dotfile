vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "ii", "<ESC>") -- ii replace ecs
keymap.set("n", "q", ":q<CR>")
keymap.set("n", "w", ":w<CR>")
keymap.set("n", "qa", ":wqall<CR>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- file tree toggle
keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>") -- null ls formatter
