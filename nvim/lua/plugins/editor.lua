local icons = require("constants.icons")

return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    opts = {
      disable_netrw = true,
      hijack_cursor = true,
      renderer = {
        root_folder_label = false,
        icons = {
          git_placement = "after",
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.hint,
          info = icons.diagnostics.info,
          warning = icons.diagnostics.warn,
          error = icons.diagnostics.error,
        },
      },
      git = {
        enable = true,
        show_on_dirs = false,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "NvimTree", "dashboard" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename", "diff" },
        lualine_c = {},
        lualine_x = { "encoding" },
        lualine_y = { "diagnostics" },
        lualine_z = { "branch" },
      },
    },
  },
  {
    "glepnir/dashboard-nvim",
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
            icon = "󰱼  ",
            icon_hl = "Title",
            desc = "Find File                                    ",
            key = "SPC SPC",
          },
          {
            icon = "󱘢  ",
            icon_hl = "Title",
            desc = "Find Word                                    ",
            key = "SPC /",
          },
          {
            icon = "󰙅  ",
            icon_hl = "Title",
            desc = "File Explorer                                ",
            key = "SPC f e",
          },
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Quit Neovim                                  ",
            key = "SPC q q",
          },
        },
      },
    },
    config = function(_, opts)
      local stats = require("lazy").stats()
      local footer = {
        "",
        "",
        "",
        "󰔚 "
        .. stats.startuptime
        .. " / 󰏋 "
        .. stats.loaded
        .. " / 󱑥 "
        .. stats.count,
      }
      require("dashboard").setup(
        vim.tbl_deep_extend("force", opts, { config = { footer = footer } })
      )
    end,
  },
}
