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
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "neo-tree", "dashboard" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
            separator = {
              left = "",
            },
            padding = {
              right = 2,
            },
          },
        },
        lualine_c = {},
        lualine_x = { "encoding" },
        lualine_z = {
          {
            "branch",
            separator = {
              right = "",
            },
            padding = {
              left = 2,
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lualine_y = {
        {
          function()
            local default_msg = "No Active Lsp"
            local msg = default_msg
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.tbl_contains(filetypes, buf_ft) then
                if msg == default_msg then
                  msg = client.name
                else
                  msg = msg .. " | " .. client.name
                end
              end
            end
            return msg
          end,
          icon = " ",
          cond = function()
            local disabled_filetypes =
              { "neo-tree", "dashboard", "TelescopePrompt" }
            return not vim.tbl_contains(
              disabled_filetypes,
              vim.api.nvim_buf_get_option(0, "filetype")
            )
          end,
          on_click = function()
            vim.cmd([[LspInfo]])
          end,
        },
      }
      local lualine_b = {
        {
          function()
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local buf_fn = vim.fn.expand("%:t")
            local file_icon =
              require("nvim-web-devicons").get_icon_by_filetype(buf_ft)
            return file_icon .. " " .. buf_fn
          end,
        },
      }
      require("lualine").setup(vim.tbl_deep_extend("force", opts, {
        sections = {
          lualine_b = lualine_b,
          lualine_y = lualine_y,
        },
      }))
    end,
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
