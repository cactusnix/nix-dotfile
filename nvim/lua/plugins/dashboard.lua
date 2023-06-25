return {
  "glepnir/dashboard-nvim",
  dependencies = {
    {},
  },
  event = "VimEnter",
  opts = {
    theme = "doom",
    config = {
      header = {
        "                                                       ",
        "                                                       ",
        "                                                       ",
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        "                                                       ",
        "                                                       ",
        "                                                       ",
        "                                                       ",
      },
      center = {
        {
          icon = "",
          desc = "Find File                                    ",
          key = "<leader> f f",
          keymap = "<leader>ff",
          action = "<leader>ff",
        },
        {
          icon = "",
          desc = "Quit NeoVim                                  ",
          key = "q",
          keymap = "q",
          action = "q",
        },
      },
    },
  },
  config = function(_, opts)
    require("dashboard").setup(opts)
  end,
}
