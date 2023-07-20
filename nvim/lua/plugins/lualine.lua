return {
  "nvim-lualine/lualine.nvim",
  main = "lualine",
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { "NvimTree" },
        winbar = {},
      },
    },
  },
}
