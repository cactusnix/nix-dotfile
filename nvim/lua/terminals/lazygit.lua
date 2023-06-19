local opts = require("constants.options")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>g",
  ":lua _lazygit_toggle()<CR>",
  opts.KEY_MAP_OPTS
)
