local utils = require("utils")

return {
  meta = {
    url = "https://github.com/JohnnyMorganz/StyLua",
    description = "An opinionated code formatter for Lua.",
  },
  command = "stylua",
  args = function()
    local config = utils.get_config_by_files({
      ".stylua.toml",
      "stylua.toml",
    }, utils.get_dirname())
    if config == nil then
      config = utils.get_config_by_lang("lua", "fmt")
    end
    return {
      "--config-path",
      config,
      "--stdin-filepath",
      "$FILENAME",
      "-",
    }
  end,
}
