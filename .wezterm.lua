local wezterm = require 'wezterm'
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane_title = tab.active_pane.title
  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    pane_title = user_title
  end
  return {
    {Foreground={Color="white"}},
    {Text=" " .. pane_title .. " "},
  }
end)

local config = wezterm.config_builder()
config.font = wezterm.font 'Monaco'
config.font_size = 16
config.line_height = 1.4
config.initial_cols = 130
config.initial_rows = 180
return config
