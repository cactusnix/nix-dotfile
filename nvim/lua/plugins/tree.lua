local icons = require("constants.icons")

return {
  "nvim-tree/nvim-tree.lua",
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
  config = function(_, opts)
    local keymap = vim.api.nvim_set_keymap
    local get_keymap_opts = require("utils.opts").get_keymap_opts
    keymap(
      "n",
      "<leader>e",
      "<cmd> NvimTreeToggle <CR>",
      get_keymap_opts("Toggle nvim tree")
    )
    require("nvim-tree").setup(opts)
  end,
}
