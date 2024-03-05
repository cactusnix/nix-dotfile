local wezterm = require("wezterm")

local config = {}

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Font
config.font = wezterm.font_with_fallback({
  { family = "Fira Mono", weight = "Regular" },
  { family = "PingFang SC", weight = "Regular" },
  "Apple Color Emoji",
})
config.font_size = 16
config.line_height = 1.2

-- Window
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

return config
