local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
local get_keymap_opts = require("utils.opts").get_keymap_opts

function Lazygit_Toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>g",
  ":lua Lazygit_Toggle()<CR>",
  get_keymap_opts("Open lazygit terminal")
)
