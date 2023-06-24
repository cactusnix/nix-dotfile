return {
  "glepnir/dashboard-nvim",
  opts = {
    theme = "doom",
  },
  config = function(_, opts)
    require("dashboard").setup(opts)
  end,
}
