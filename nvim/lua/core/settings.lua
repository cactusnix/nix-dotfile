local opt = vim.opt
local glob = vim.g

-- Global
glob.loaded_netrw = 1
glob.loaded_netrwPlugin = 1

-- Feature
opt.swapfile = false
opt.wrap = false
opt.showmode = false
opt.autoread = true
opt.completeopt = { "menuone", "preview", "noselect" }
opt.ignorecase = true
opt.smartcase = true

-- Line
opt.number = true
opt.relativenumber = true

-- Space & Tab
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
