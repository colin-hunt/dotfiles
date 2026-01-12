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

