local map = vim.api.nvim_set_keymap
-- 复用 options 参数
local opt = { noremap = true, silent = true }
-- 分屏 split = s, vertically = v, horizontally = h
map("n", "sv", "", opt)
map("n", "sh", "", opt)
