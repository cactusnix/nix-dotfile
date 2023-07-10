local opts = require("constants.options").KEYMAP_OPTS
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

function Lazygit_Toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", ":lua Lazygit_Toggle()<CR>", opts)
