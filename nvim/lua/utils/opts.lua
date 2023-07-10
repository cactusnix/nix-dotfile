local M = {}

M.get_keymap_opts = function(desc)
  local tpl = {
    noremap = true,
    silent = true,
  }
  if desc ~= nil then
    tpl["desc"] = desc
  end
  return tpl
end

return M
