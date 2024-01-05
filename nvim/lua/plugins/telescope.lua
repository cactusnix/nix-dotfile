return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>,",
        "<CMD>Telescope buffers<CR>",
        desc = "Switch buffer",
      },
      {
        "<leader>/",
        "<CMD>Telescope live_grep<CR>",
        desc = "Find words",
      },
      {
        "<leader>:",
        "<CMD>Telescope command_history<CR>",
        desc = "Find command history",
      },
      {
        "<leader><space>",
        "<CMD>Telescope find_files<CR>",
        desc = "Find files",
      },
    },
  },
}
