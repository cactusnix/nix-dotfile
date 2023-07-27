return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        "<cmd>Neotree<cr>",
        desc = "Explorer Neotree",
      },
    },
    opts = {
      window = {
        mappings = {
          ["<Tab>"] = {
            "toggle_node",
            nowait = false,
          },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
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
    event = "VimEnter",
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "neo-tree", "dashboard" },
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
