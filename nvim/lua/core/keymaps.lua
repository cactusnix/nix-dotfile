local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Save
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Window
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- File Explorer
map(
  "n",
  "<leader>fe",
  "<cmd>NvimTreeToggle<cr>",
  { desc = "Explorer NvimTree" }
)

-- Buffer
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Telescope
map("n", "<leader>,", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Find words" })
map(
  "n",
  "<leader>:",
  "<cmd>Telescope command_history<cr>",
  { desc = "Find command history" }
)
map(
  "n",
  "<leader><space>",
  "<cmd>Telescope find_files<cr>",
  { desc = "Find files" }
)

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
