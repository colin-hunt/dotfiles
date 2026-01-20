-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 144
config.initial_rows = 58

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = 'AdventureTime'

-- Mouse bindings
config.mouse_bindings = {
  -- Right-click: copy if text selected, otherwise paste
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(wezterm.action.CopyTo 'ClipboardAndPrimarySelection', pane)
      else
        window:perform_action(wezterm.action.PasteFrom 'Clipboard', pane)
      end
    end),
  },
}

config.keys = {
  -- ===================
  -- PANE MANAGEMENT
  -- ===================
  -- Split panes (Cmd+Ctrl+Arrow represents direction)
  {
    key = 'RightArrow',
    mods = 'CMD|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'DownArrow',
    mods = 'CMD|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Navigate panes (Cmd+Option+Arrow)
  {
    key = 'LeftArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Rotate panes (Cmd+Option+r/R)
  {
    key = 'r',
    mods = 'CMD|OPT',
    action = wezterm.action.RotatePanes 'Clockwise',
  },
  {
    key = 'r',
    mods = 'CMD|OPT|SHIFT',
    action = wezterm.action.RotatePanes 'CounterClockwise',
  },
  -- Resize panes (Cmd+Option+Shift+Arrow)
  {
    key = 'LeftArrow',
    mods = 'CMD|OPT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CMD|OPT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CMD|OPT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CMD|OPT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  -- Close pane (Cmd+W)
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- ===================
  -- TAB MANAGEMENT
  -- ===================
  -- Move tab left/right (Cmd+Shift+Arrow)
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.MoveTabRelative(1),
  },
  -- Navigate tabs (Cmd+Shift+[/])
  {
    key = ']',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = '[',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Close tab (Cmd+Shift+W)
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

-- Finally, return the configuration to wezterm:
return config

