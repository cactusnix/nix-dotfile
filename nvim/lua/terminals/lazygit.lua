local opts = require("constants.options").KEYMAP_OPTS
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

---@diagnostic disable-next-line: lowercase-global
function lazygit_terminal_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>g",
  ":lua lazygit_terminal_toggle()<CR>",
  opts
)
