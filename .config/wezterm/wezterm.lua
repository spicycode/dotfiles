-- Pull in the wezterm API
local wezterm = require 'wezterm'
local appearance = require 'appearance'

local colors = {
  peach = "#FFDAB9",
  green = "#66b032"
}

local function is_vim(pane)
  local process_info = pane:get_foreground_process_info()
  local process_name = process_info and process_info.name

  return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  -- reverse lookup
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.term = "wezterm"

config.font = wezterm.font_with_fallback({
  "Liga SFMono Nerd Font",
  "Apple Color Emoji",
})

config.window_frame = {
  font = wezterm.font({ family = 'Liga SFMono Nerd Font', weight = 'Bold' }),
  font_size = 13,
}

config.font_size = 15
config.max_fps = 120
config.enable_wayland = false
config.pane_focus_follows_mouse = false
config.warn_about_missing_glyphs = false
config.check_for_updates = true
config.line_height = 1.25
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
  brightness = appearance.is_dark() and 0.85 or 0.95,
}

config.enable_scroll_bar = false
-- config.tab_bar_at_bottom = false
-- config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.window_background_opacity = 1.0
config.tab_max_width = 50
config.hide_tab_bar_if_only_one_tab = false
config.disable_default_key_bindings = false
config.front_end = "WebGpu"
config.color_scheme = 'Catppuccin Mocha'

config.keys = {
  -- move between split panes
  split_nav("move", "h"),
  split_nav("move", "j"),
  split_nav("move", "k"),
  split_nav("move", "l"),
  -- resize panes
  split_nav("resize", "h"),
  split_nav("resize", "j"),
  split_nav("resize", "k"),
  split_nav("resize", "l"),
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

local function segments_for_right_status(window)
  return {
    -- window:active_workspace(),
    wezterm.strftime('%a %b %-d %H:%M'),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local segments = segments_for_right_status(window)

  local color_scheme = window:effective_config().resolved_palette
  -- Note the use of wezterm.color.parse here, this returns
  -- a Color object, which comes with functionality for lightening
  -- or darkening the colour (amongst other things).
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  -- Each powerline segment is going to be coloured progressively
  -- darker/lighter depending on whether we're on a dark/light colour
  -- scheme. Let's establish the "from" and "to" bounds of our gradient.
  local gradient_to, gradient_from = bg
  if appearance.is_dark() then
    gradient_from = gradient_to:lighten(0.2)
  else
    gradient_from = gradient_to:darken(0.2)
  end

  -- Yes, WezTerm supports creating gradients, because why not?! Although
  -- they'd usually be used for setting high fidelity gradients on your terminal's
  -- background, we'll use them here to give us a sample of the powerline segment
  -- colours we need.
  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #segments -- only gives us as many colours as we have segments.
  )

  -- We'll build up the elements to send to wezterm.format in this table.
  local elements = {}

  for i, seg in ipairs(segments) do
    local is_first = i == 1

    if is_first then
      table.insert(elements, { Background = { Color = 'none' } })
    end
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })

    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

return config
