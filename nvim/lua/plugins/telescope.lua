return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    {
      "<leader>,",
      "<cmd>Telescope buffers<cr>",
      desc = "Switch buffer",
    },
    {
      "<leader>/",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find words",
    },
    {
      "<leader>:",
      "<cmd>Telescope command_history<cr>",
      desc = "Find command history",
    },
    {
      "<leader><space>",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      undo = {},
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
  end,
}
