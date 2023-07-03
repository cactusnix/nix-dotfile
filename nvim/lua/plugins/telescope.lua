return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local opts = require("constants.options").KEYMAP_OPTS
    keymap(
      "n",
      "<leader>ff",
      ":lua require('telescope.builtin').find_files()<CR>",
      opts
    )
    keymap(
      "n",
      "<leader>fg",
      ":lua require('telescope.builtin').live_grep()<CR>",
      opts
    )
    keymap(
      "n",
      "<leader>fb",
      ":lua require('telescope.builtin').buffers()<CR>",
      opts
    )
    keymap(
      "n",
      "<leader>fh",
      ":lua require('telescope.builtin').help_tags()<CR>",
      opts
    )
  end,
}
