local packer = require("packer")

packer.startup({
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- colorschema
    use "folke/tokyonight.nvim"
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons" -- optional, for file icons
      }
    }
  end,
  config = {
    display = {
      -- use a floating window for command outputs
      open_fn = require("packer.util").float
    }
  }
})
