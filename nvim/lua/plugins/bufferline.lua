return {
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
  config = function(_, opts)
    local keymap = vim.api.nvim_set_keymap
    local get_keymap_opts = require("utils.opts").get_keymap_opts
    keymap(
      "n",
      "<leader>bc",
      "<cmd> enew <CR>",
      get_keymap_opts("Create new buffer")
    )
    keymap(
      "n",
      "<leader>bn",
      "<cmd> BufferLineMoveNext <CR>",
      get_keymap_opts("Goto next buffer")
    )
    keymap(
      "n",
      "<leader>bp",
      "<cmd> BufferLineMovePrev <CR>",
      get_keymap_opts("Goto prev buffer")
    )
    keymap(
      "n",
      "<leader>bd",
      "<cmd> bdelete <CR>",
      get_keymap_opts("Delete current buffer")
    )
    require("bufferline").setup(opts)
  end,
}
