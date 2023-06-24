return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").lua_ls.setup(require("lsp.lua-ls"))
  end,
}
