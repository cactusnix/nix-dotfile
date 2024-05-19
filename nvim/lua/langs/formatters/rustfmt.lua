local utils = require("utils")

return {
  meta = {
    url = "https://github.com/rust-lang/rustfmt",
    description = "A tool for formatting rust code according to style guidelines.",
  },
  command = "rustfmt",
  args = function()
    local config = utils.get_config_by_files({
      ".rustfmt.toml",
      "rustfmt.toml",
    }, utils.get_dirname())
    if config == nil then
      config = utils.get_config_by_lang("rust", "fmt")
    end
    return {
      "--config-path",
      config,
    }
  end,
}
