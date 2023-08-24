-- HACK workaround: make missing fields lint disable
---@diagnostic disable: missing-fields
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
    },
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local window_bordered_opts = cmp.config.window.bordered({
      scrollbar = false,
    })
    local select_opts = {
      behavior = cmp.SelectBehavior.Select,
    }
    cmp.setup({
      enabled = function()
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
      end,
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            path = "[Path]",
            calc = "[Calc]",
          },
          maxwidth = 100,
          ellipsis_char = "...",
        }),
      },
      view = {
        entries = "custom",
        docs = {
          auto_open = true,
        },
      },
      window = {
        completion = window_bordered_opts,
        documentation = window_bordered_opts,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
      },
      experimental = {
        ghost_text = true,
      },
    })
    -- Search Completion
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    -- Command Completion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
