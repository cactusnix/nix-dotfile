return {
  "nvim-lualine/lualine.nvim",
  main = "lualine",
  opts = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "NvimTree" },
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
}
