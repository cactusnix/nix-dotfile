local get_config_by_lang = require("utils").get_config_by_lang

return {
  meta = {
    url = "https://github.com/JohnnyMorganz/StyLua",
    description = "An opinionated code formatter for Lua.",
  },
  command = "stylua",
  args = {
    "--config-path",
    get_config_by_lang("lua", "fmt"),
    "--stdin-filepath",
    "$FILENAME",
    "-",
  },
}
