return {
  {
    "nvim-telescope/telescope.nvim",
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
    config = function()
      require("telescope").setup()
    end
  },
}
