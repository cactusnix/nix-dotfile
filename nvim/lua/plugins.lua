local packer = require("packer")

packer.startup({
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- lsp config 
    use "neovim/nvim-lspconfig"
    -- lsp server manage
    use "williamboman/mason.nvim"
    -- lsp config fix gap
    use "williamboman/mason-lspconfig.nvim"
    -- colorschema
    use "folke/tokyonight.nvim"
    -- file explorer
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons" -- optional, for file icons
      }
    }
    -- 补全引擎
    use "hrsh7th/nvim-cmp"
    -- for vsnip
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-vsnip"
    -- inner lsp
    use "hrsh7th/cmp-nvim-lsp"
    -- buffer 
    use "hrsh7th/cmp-buffer"
    -- path
    use "hrsh7th/cmp-path"
    -- command line
    use "hrsh7th/cmp-cmdline"
    -- status line
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons"
      }
    }
    -- trouble
    use { 
      "folke/trouble.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons"
      }
    }
    -- null ls
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    -- 模糊搜索
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    -- dashboard startup
    use "glepnir/dashboard-nvim"
    -- nvim treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
  end,
  config = {
    display = {
      -- use a floating window for command outputs
      open_fn = require("packer.util").float
    }
  }
})
