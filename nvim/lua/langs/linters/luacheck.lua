local utils = require("utils")

return {
  meta = {
    url = "https://github.com/mpeterv/luacheck",
    description = "A tool for linting and static analysis of Lua code.",
  },
  cmd = "luacheck",
  stdin = true,
  ignore_exitcode = true,
  args = {
    "--config",
    function()
      local config = utils.get_config_by_files({
        ".luacheckrc",
      }, utils.get_dirname())
      if config == nil then
        config = utils.get_config_by_lang("lua", "lint")
      end
      return config
    end,
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
  },
  parser = require("lint.parser").from_pattern(
    "[^:]+:(%d+):(%d+)-(%d+): %((%a)(%d+)%) (.*)",
    { "lnum", "col", "end_col", "severity", "code", "message" },
    {
      W = vim.diagnostic.severity.WARN,
      E = vim.diagnostic.severity.ERROR,
    },
    { source = "luacheck" },
    { end_col_offset = 0 }
  ),
}
