return {
  -- The plugin can easily create file.
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
    },
    opts = {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          -- TODO: make this code better
          local hidden = {
            node_modules = true,
          }
          if hidden[name] then
            return true
          end
          return false
        end,
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
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
    -- Only load when no args after nvim command.
    event = function()
      if vim.fn.argc() == 0 then
        return "VimEnter"
      end
    end,
    opts = function()
      local logo = [[
       ▄████▄   ▄▄▄       ▄████▄  ▄▄▄█████▓ █    ██   ██████  ███▄    █  ██▓▒██   ██▒
      ▒██▀ ▀█  ▒████▄    ▒██▀ ▀█  ▓  ██▒ ▓▒ ██  ▓██▒▒██    ▒  ██ ▀█   █ ▓██▒▒▒ █ █ ▒░
      ▒▓█    ▄ ▒██  ▀█▄  ▒▓█    ▄ ▒ ▓██░ ▒░▓██  ▒██░░ ▓██▄   ▓██  ▀█ ██▒▒██▒░░  █   ░
      ▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒▓▓▄ ▄██▒░ ▓██▓ ░ ▓▓█  ░██░  ▒   ██▒▓██▒  ▐▌██▒░██░ ░ █ █ ▒ 
      ▒ ▓███▀ ░ ▓█   ▓██▒▒ ▓███▀ ░  ▒██▒ ░ ▒▒█████▓ ▒██████▒▒▒██░   ▓██░░██░▒██▒ ▒██▒
      ░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░  ▒ ░░   ░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░
        ░  ▒     ▒   ▒▒ ░  ░  ▒       ░    ░░▒░ ░ ░ ░ ░▒  ░ ░░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░
      ░          ░   ▒   ░          ░       ░░░ ░ ░ ░  ░  ░     ░   ░ ░  ▒ ░ ░    ░  
      ░ ░            ░  ░░ ░                  ░           ░           ░  ░   ░    ░  
      ░                  ░                                                           
      ]]
      logo = "\n\n" .. logo .. "\n\n"
      return {
        theme = "doom",
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = require("constants.icons").search .. " ",
              key = "SPC SPC",
            },
            {
              action = "Telescope oldfiles",
              desc = " Find recent files",
              icon = require("constants.icons").file .. " ",
              key = "SPC f r",
            },
            {
              action = "Telescope live_grep",
              desc = " Find words",
              icon = require("constants.icons").word .. " ",
              key = "SPC f w",
            },
            {
              action = "qa",
              desc = " Quit",
              icon = require("constants.icons").quit .. " ",
              key = "q",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "",
              "",
              "⚡ Neovim loaded "
                .. stats.loaded
                .. "/"
                .. stats.count
                .. " plugins in "
                .. ms
                .. "ms",
              "",
              "",
            }
          end,
        },
      }
    end,
    config = function(_, opts)
      require("dashboard").setup(opts)
    end,
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
    event = "BufReadPost",
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = { "dashboard" },
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = require("constants.icons").neovim,
          },
        },
        lualine_b = {
          {
            "filename",
            file_status = true,
          },
        },
        lualine_c = {
          {
            "branch",
            icon = require("constants.icons").source,
          },
          {
            "diff",
            symbols = {
              added = require("constants.icons").added .. " ",
              modified = require("constants.icons").modified .. " ",
              removed = require("constants.icons").removed .. " ",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = require("constants.icons").close .. " ",
              warn = require("constants.icons").warning .. " ",
              info = require("constants.icons").info .. " ",
              hint = require("constants.icons").lightbulb .. " ",
            },
          },
          {
            function()
              return require("lazy.status").updates()
            end,
            cond = function()
              return require("lazy.status").has_updates()
            end,
            on_click = function()
              vim.cmd("Lazy update")
            end,
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({
                bufnr = 0,
              })
              local component = ""
              for i, v in ipairs(clients) do
                component = component .. vim.tbl_get(v, "name")
                -- Sometimes may has more than one lsp server.
                if i ~= #clients then
                  component = component .. "/"
                end
              end
              return require("constants.icons").gear .. " " .. component
            end,
            cond = function()
              local clients = vim.lsp.get_active_clients({
                bufnr = 0,
              })
              return #clients > 0
            end,
            on_click = function()
              vim.cmd("LspInfo")
            end,
          },
        },
        lualine_y = {
          {
            function()
              local formatters = require("conform").list_formatters()
              local component = ""
              for i, v in ipairs(formatters) do
                component = component .. vim.tbl_get(v, "name")
                -- Sometimes may has more than one formatter.
                if i ~= #formatters then
                  component = component .. "/"
                end
              end
              return require("constants.icons").check .. " " .. component
            end,
            cond = function()
              local formatters = require("conform").list_formatters()
              return #formatters > 0
            end,
            on_click = function()
              require("conform").format({ async = true, lsp_fallback = true })
            end,
          },
          {
            function()
              local ft = vim.bo.filetype
              local linters = require("lint")._resolve_linter_by_ft(ft)
              return require("constants.icons").flash
                .. " "
                .. table.concat(linters, "/")
            end,
            cond = function()
              local ft = vim.bo.filetype
              local linters = require("lint")._resolve_linter_by_ft(ft)
              return #linters > 0
            end,
            on_click = function()
              require("lint").try_lint()
            end,
          },
        },
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  -- The plugin make motion nice.
  {
    "folke/flash.nvim",
    event = "BufReadPost",
    config = true,
  },
  -- The plugin show indent blankline.
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufReadPost",
    opts = {
      symbol = "│",
      options = {
        try_as_border = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "dashboard",
          "lazy",
          "notify",
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  -- The plugin measure startup time, it uses vim script so maybe not need config = true.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  -- The plugin make buffer better.
  {
    "akinsho/bufferline.nvim",
    -- FIX: Why it can be loaded at BufReadPost?
    lazy = false,
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
    opts = {
      options = {
        diagnostics = "nvim_lsp",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  -- The plugin make ui animate better.
  {
    "echasnovski/mini.animate",
    version = false,
    event = "BufReadPost",
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
  -- The plugin show better git signs.
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = true,
  },
  -- The plugin is theme plugin. I will replace it later with my own theme plguin.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Load it first.
    config = true,
  },
  -- The plugin make comments better.
  {
    "echasnovski/mini.comment",
    version = false,
    event = "BufReadPost",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "akinsho/toggleterm.nvim",
    keys = function()
      local toggle_terminal = require("utils").toggle_terminal
      return {
        {
          "<leader>lg",
          toggle_terminal({
            cmd = "lazygit",
            direction = "float",
          }),
          desc = "[l]azy[g]it termial",
        },
      }
    end,
    config = true,
  },
}
