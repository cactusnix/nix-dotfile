local map = vim.api.nvim_set_keymap

-- 复用 options 参数
local opt = { noremap = true, silent = true }

-- fix default "s" action for delete {count} characters & start insert
map("n", "s", "", opt)

-- windows = w, vertically = v, horizontally = h

-- 垂直方向分屏，也就是在右边出现
map("n", "wv", ":vs<CR>", opt)
-- 水平方向分屏，也就是在下边出现
map("n", "wh", ":sp<CR>", opt)
-- 光标跳转
map("n", "cj", ":wincmd j<CR>", opt)
map("n", "ck", ":wincmd k<CR>", opt)
map("n", "ch", ":wincmd h<CR>", opt)
map("n", "cl", ":wincmd l<CR>", opt)

-- 关闭当前
map("n", "ww", ":clo<CR>", opt)
-- 关闭其他
map("n", "wo", ":on<CR>", opt)

-- quit = q
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>:", opt)

-- file = f
map("n", "fs", ":w<CR>", opt)

-- nvim-tree plugin
map("n", "nt", ":NvimTreeToggle<CR>", opt)

-- telescope plugin
map("n", "<C-p>", ":Telescope find_files<CR>", opt)

-- null ls plugin
map("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", opt)
