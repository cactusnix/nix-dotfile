return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
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
      get_keymap_opts("Find help pages by name")
    )
    keymap(
      "n",
      "<leader>fz",
      "<cmd> Telescope current_buffer_fuzzy_find <CR>",
      get_keymap_opts("Find text by word in current buffer")
    )
    keymap(
      "n",
      "<leader>cm",
      "<cmd> Telescope git_commits <CR>",
      get_keymap_opts("Find commits by word in git commits")
    )
    keymap(
      "n",
      "<leader>gt",
      "<cmd> Telescope git_status <CR>",
      get_keymap_opts("Find files by name in git status")
    )
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
