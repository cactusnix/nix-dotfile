return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    config = true,
  },
  -- The plugin can make jk to escape better.
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin makes start screen beautiful.
  {
    "nvimdev/dashboard-nvim",
    opts = function()
      return {
        theme = "doom",
        config = {
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "SPC f f",
            },
            {
              action = "Telescope oldfiles",
              desc = " Find recent files",
              icon = " ",
              key = "SPC f r",
            },
            {
              action = "Telescope live_grep",
              desc = " Find words",
              icon = " ",
              key = "SPC f w",
            },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded "
                .. stats.loaded
                .. "/"
                .. stats.count
                .. " plugins in "
                .. ms
                .. "ms",
            }
          end,
        },
      }
    end,
    lazy = false,
  },
  -- The plugin can show keybindings better.
  {
    "folke/which-key.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin can auto pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- The plugin show nice status line.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = true,
  },
  -- The plugin make motion nice.
  {
    "folke/flash.nvim",
    lazy = false,
    config = true,
  },
  -- The plugin show indent blankline.
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufRead",
    config = true,
  },
  -- The plugin measure startup time, it uses vim script so maybe not need config = true.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  -- The plugin make buffer better.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<CMD>BufferLineTogglePin<CR>", desc = "[b]uffer [p]in" },
      {
        "<leader>bo",
        "<Cmd>BufferLineCloseOthers<CR>",
        desc = "[b]uffer close [o]ther",
      },
      {
        "<leader>br",
        "<CMD>BufferLineCloseRight<CR>",
        desc = "[b]uffer close to [r]ight",
      },
      {
        "<leader>bl",
        "<CMD>BufferLineCloseLeft<CR>",
        desc = "[b]uffer close to [l]eft",
      },
      { "<S-h>", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<S-l>", "<CMD>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "[b", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "]b", "<CMD>BufferLineCycleNext<CR>", desc = "Next buffer" },
    },
    config = true,
  },
  -- The plugin make ui animate better.
  {
    "echasnovski/mini.animate",
    version = false,
    event = "VeryLazy",
    config = true,
  },
  -- The plugin make neovim more nice.
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = true,
  },
  -- The plugin is just for fun.
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      {
        "<leader>mr",
        "<CMD>CellularAutomaton make_it_rain<CR>",
        desc = "[m]ake code [r]ain",
      },
      {
        "<leader>mg",
        "<CMD>CellularAutomaton game_of_life<CR>",
        desc = "[m]ake code [g]ame",
      },
    },
  },
}
