local M = {}

function M.keymap_set(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
