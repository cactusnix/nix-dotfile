return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local get_keymap_opts = require("utils.opts").get_keymap_opts
    keymap(
      "n",
      "<leader>ff",
      ":lua require('telescope.builtin').find_files()<CR>",
      get_keymap_opts("Find files by name int current dir")
    )
    keymap(
      "n",
      "<leader>fg",
      ":lua require('telescope.builtin').live_grep()<CR>",
      get_keymap_opts("Find files by text in current dir")
    )
    keymap(
      "n",
      "<leader>fb",
      ":lua require('telescope.builtin').buffers()<CR>",
      get_keymap_opts("Find files by name in current buffers")
    )
    keymap(
      "n",
      "<leader>fh",
      ":lua require('telescope.builtin').help_tags()<CR>",
      get_keymap_opts()
    )
  end,
}
