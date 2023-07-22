local icons = require("constants.icons")

return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
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
    require("nvim-tree").setup(opts)
  end,
}
