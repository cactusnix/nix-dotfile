return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      {
        "<leader><Space>",
        "<CMD>Telescope find_files<CR>",
        desc = "find files",
      },
      {
        "<leader>fb",
        "<CMD>Telescope buffers<CR>",
        desc = "[f]ind [b]uffers",
      },
      {
        "<leader>fw",
        "<CMD>Telescope live_grep<CR>",
        desc = "[f]ind [w]ords",
      },
      {
        "<leader>fr",
        "<CMD>Telescope oldfiles<CR>",
        desc = "[f]ind [r]ecent files",
      },
      {
        "<leader>ff",
        "<CMD>Telescope find_files<CR>",
        desc = "[f]ind [f]iles",
      },
    },
  },
}
