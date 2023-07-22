local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "i", "v", "n", "s" }, "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map(
  "n",
  "<leader>fe",
  "<cmd>NvimTreeToggle<cr>",
  { desc = "Explorer NvimTree" }
)
