vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "ii", "<ESC>") -- ii replace ecs

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- file tree toggle

keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>") -- null ls formatter
