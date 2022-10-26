local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    -- prev
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- next
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- selected
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" }
  }, {
    { name = "buffer" },
    { name = "path" }
  })
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})
