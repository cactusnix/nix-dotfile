return {
  "glepnir/dashboard-nvim",
  dependencies = {
    {},
  },
  event = "VimEnter",
  opts = {
    theme = "doom",
    shortcut_type = "number",
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
          icon_hl = "group",
          desc = "description",
          desc_hl = "group",
          key = "shortcut key in dashboard buffer not keymap !!",
          key_hl = "group",
          action = "",
        },
      },
    },
  },
  config = function(_, opts)
    require("dashboard").setup(opts)
  end,
}
