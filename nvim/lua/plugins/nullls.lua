-- TODO: Remove null ls plugin due to it will be archived
return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end
    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.swift_format,
      -- null_ls.builtins.diagnostics.swiftlint,
      require("temp.swiftlint"),
    }
    null_ls.setup({
      sources = sources,
      on_attach = on_attach,
    })
  end,
}
