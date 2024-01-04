return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    opt = {},
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    config = function()
      require("oil").setup()
    end
  },
}
