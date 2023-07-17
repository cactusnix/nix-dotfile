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
      "<cmd> Telescope find_files <CR>",
      get_keymap_opts("Find files by name int current dir")
    )
    keymap(
      "n",
      "<leader>fw",
      "<cmd> Telescope live_grep <CR>",
      get_keymap_opts("Find files by word in current dir")
    )
    keymap(
      "n",
      "<leader>fb",
      "<cmd> Telescope buffers <CR>",
      get_keymap_opts("Find files by name in current buffers")
    )
    keymap(
      "n",
      "<leader>fh",
      "<cmd> Telescope help_tags <CR>",
      get_keymap_opts("Find help pages")
    )
    keymap(
      "n",
      "<leader>fz",
      "<cmd> Telescope current_buffer_fuzzy_find <CR>",
      get_keymap_opts("Find in current buffer")
    )
  end,
}
