local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil

if is_linux then
    config.window_decorations = "RESIZE"
end
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font_size = 16
config.font = wezterm.font_with_fallback {
  'CaskaydiaCove Nerd Font Mono',
}
config.bold_brightens_ansi_colors = 'BrightAndBold'

return config
