local icons = require("constants.icons")

local diagnostic_signs = {
  {
    name = "DiagnosticSignError",
    text = icons.diagnostics.error,
  },
  {
    name = "DiagnosticSignWarn",
    text = icons.diagnostics.warn,
  },
  {
    name = "DiagnosticSignHint",
    text = icons.diagnostics.hint,
  },
  {
    name = "DiagnosticSignInfo",
    text = icons.diagnostics.info,
  },
}

for _, sign in ipairs(diagnostic_signs) do
  vim.fn.sign_define(
    sign.name,
    { texthl = sign.name, text = sign.text, numhl = sign.name }
  )
end
