return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
    end,
  },
  config = function(_, opts)
    require("auto-dark-mode").setup(opts)
  end,
}
