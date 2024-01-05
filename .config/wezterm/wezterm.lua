-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- local is_dark = wezterm.gui.get_appearance():find("Dark")
local is_dark = true

local colors = {
  peach = "#FFDAB9",
  green = "#66b032"
}

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
  "Liga SFMono Nerd Font",
  "Apple Color Emoji",
})

config.font_size = 16
config.max_fps = 120
config.enable_wayland = false
config.pane_focus_follows_mouse = false
config.warn_about_missing_glyphs = false
config.show_update_window = true
config.check_for_updates = true
config.line_height = 1.5
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 0,
}
config.initial_cols = 170
config.initial_rows = 30

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = is_dark and 0.85 or 0.95,
}

config.enable_scroll_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 1.0
config.tab_max_width = 50
config.hide_tab_bar_if_only_one_tab = false
config.disable_default_key_bindings = false
config.front_end = "WebGpu"
config.color_scheme = 'Catppuccin Mocha'

config.keys = {
  {
    mods = "ALT",
    key = [[\]],
    action = wezterm.action({
      SplitHorizontal = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    mods = "ALT|SHIFT",
    key = [[|]],
    action = wezterm.action.SplitPane({
      top_level = true,
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    mods = "ALT",
    key = [[-]],
    action = wezterm.action({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    mods = "ALT|SHIFT",
    key = [[_]],
    action = wezterm.action.SplitPane({
      top_level = true,
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  {
    key = "n",
    mods = "ALT",
    action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
  },
  {
    key = "Q",
    mods = "ALT",
    action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
  },
  { key = "q", mods = "ALT",        action = wezterm.action.CloseCurrentPane({ confirm = false }) },
  { key = "z", mods = "ALT",        action = wezterm.action.TogglePaneZoomState },
  { key = "h", mods = "ALT|SHIFT",  action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
  { key = "j", mods = "ALT|SHIFT",  action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
  { key = "k", mods = "ALT|SHIFT",  action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
  { key = "l", mods = "ALT|SHIFT",  action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
  { key = "h", mods = "ALT",        action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
  { key = "j", mods = "ALT",        action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
  { key = "k", mods = "ALT",        action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
  { key = "l", mods = "ALT",        action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },
  { key = "[", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = -1 }) },
  { key = "]", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = 1 }) },
  { key = "{", mods = "SHIFT|ALT",  action = wezterm.action.MoveTabRelative(-1) },
  { key = "}", mods = "SHIFT|ALT",  action = wezterm.action.MoveTabRelative(1) },
  { key = "v", mods = "ALT",        action = wezterm.action.ActivateCopyMode },
  { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
  { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
  { key = "=", mods = "CTRL",       action = wezterm.action.IncreaseFontSize },
  { key = "-", mods = "CTRL",       action = wezterm.action.DecreaseFontSize },
  { key = "1", mods = "ALT",        action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2", mods = "ALT",        action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3", mods = "ALT",        action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4", mods = "ALT",        action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5", mods = "ALT",        action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6", mods = "ALT",        action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7", mods = "ALT",        action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8", mods = "ALT",        action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9", mods = "ALT",        action = wezterm.action({ ActivateTab = 8 }) },
}

config.hyperlink_rules = {
  {
    regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
    format = "$0",
  },
  {
    regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
    format = "$0",
  },
  {
    regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
    format = "mailto:$0",
  },
  {
    regex = [[\bfile://\S*\b]],
    format = "$0",
  },
  {
    regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
    format = "$0",
  },
}

local function is_vi_process(pane)
  return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
  if is_vi_process(pane) then
    window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "ALT" }), pane)
  else
    window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
  conditional_activate_pane(window, pane, "Right", "l")
end)

wezterm.on("ActivatePaneDirection-left", function(window, pane)
  conditional_activate_pane(window, pane, "Left", "h")
end)

wezterm.on("ActivatePaneDirection-up", function(window, pane)
  conditional_activate_pane(window, pane, "Up", "k")
end)

wezterm.on("ActivatePaneDirection-down", function(window, pane)
  conditional_activate_pane(window, pane, "Down", "j")
end)

local function get_process(tab)
  local process_icons = {
    ["docker"] = {
      { Foreground = { AnsiColor = 'Blue' } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["docker-compose"] = {
      { Foreground = { AnsiColor = 'Blue' } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["nvim"] = {
      { Foreground = { Color = colors.green } },
      { Text = wezterm.nerdfonts.custom_vim },
    },
    ["vim"] = {
      { Foreground = { Color = colors.green } },
      { Text = wezterm.nerdfonts.dev_vim },
    },
    ["node"] = {
      { Foreground = { Color = colors.green } },
      { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    ["zsh"] = {
      { Foreground = { Color = colors.peach } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["fish"] = {
      { Foreground = { Color = colors.peach } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    ["bash"] = {
      { Foreground = { Color = colors.peach } },
      { Text = wezterm.nerdfonts.cod_terminal_bash },
    },
    ["htop"] = {
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["btop"] = {
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    ["cargo"] = {
      { Text = wezterm.nerdfonts.dev_rust },
    },
    ["go"] = {
      { Text = wezterm.nerdfonts.mdi_language_go },
    },
    ["git"] = {
      { Text = wezterm.nerdfonts.dev_git },
    },
    ["lua"] = {
      { Text = wezterm.nerdfonts.seti_lua },
    },
    ["wget"] = {
      { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    ["curl"] = {
      { Text = wezterm.nerdfonts.mdi_flattr },
    },
    ["gh"] = {
      { Text = wezterm.nerdfonts.dev_github_badge },
    },
  }

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

  return wezterm.format(
    process_icons[process_name]
    or { { Text = string.format("[%s]", process_name) } }
  -- or { { Foreground = { Color = colors.sky } }, { Text = string.format("[%s]", process_name) } }
  )
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

  return current_dir == HOME_DIR and "  ~"
      or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
  return wezterm.format({
    { Attribute = { Intensity = "Half" } },
    { Text = string.format(" %s  ", tab.tab_index + 1) },
    "ResetAttributes",
    { Text = get_process(tab) },
    { Text = " " },
    { Text = get_current_working_dir(tab) },
    { Text = "  ▕" },
  })
end)

wezterm.on("update-right-status", function(window)
  window:set_right_status(wezterm.format({
    { Attribute = { Intensity = "Half" } },
    { Text = wezterm.strftime(" %B %d %Y %H:%M %p ") },
  }))
end)

return config
