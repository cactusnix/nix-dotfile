-- nvim treesitter plugin setup
local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = {"lua"},
  highlight = {
    enable = true,
    -- disable the vim highlight
    additional_vim_regex_highlighting = false
  }
})
