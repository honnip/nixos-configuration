local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.use_ime = true

config.color_scheme = "Sonokai (Gogh)"
config.freetype_load_target = "Light"
config.unicode_version = 14
config.font = wezterm.font_with_fallback({
  "Sarasa Term K",
  "Iosevka Term",
  "Noto Sans Mono",
  "IBM Plex Mono",
})
config.font_size = 14

config.initial_rows = 18
config.initial_cols = 80
config.window_frame = {
  font = wezterm.font_with_fallback({ "Iosevka Term", "Sarasa Term K" }),
  font_size = 12,
}

config.detect_password_input = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true

return config
