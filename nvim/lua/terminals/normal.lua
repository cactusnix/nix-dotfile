local Terminal = require("toggleterm.terminal").Terminal
local normal = Terminal:new({ direction = "horizontal" })
local get_keymap_opts = require("utils.opts").get_keymap_opts

function Normal_Toggle()
  normal:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ":lua Normal_Toggle()<CR>",
  get_keymap_opts("Open normal terminal")
)
