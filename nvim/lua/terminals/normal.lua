local opts = require("constants.options").KEYMAP_OPTS
local Terminal = require("toggleterm.terminal").Terminal
local normal = Terminal:new({ direction = "horizontal" })

function Normal_Toggle()
  normal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", ":lua Normal_Toggle()<CR>", opts)
