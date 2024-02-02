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
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        prompt_prefix = " " .. require("constants.icons").search .. "  ",
        selection_caret = "  ",
        path_display = { "truncate" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
}
