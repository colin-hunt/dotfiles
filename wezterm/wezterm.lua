-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 144
config.initial_rows = 58

-- or, changing the font size and color scheme.
config.font_size = 13
config.color_scheme = 'Argonaut'
config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font({ family = 'Helvetica', weight = 'Bold' }),
  font_size = 14.0,
  active_titlebar_bg = '#0d1117',
  inactive_titlebar_bg = '#0d1117',
}
config.tab_max_width = 48

config.colors = {
  tab_bar = {
    background = '#0d1117',
    active_tab = {
      bg_color = '#232323',
      fg_color = '#ffffff',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#0d1117',
      fg_color = '#6e7681',
    },
    inactive_tab_hover = {
      bg_color = '#1a1a2e',
      fg_color = '#c0c0c0',
    },
    new_tab = {
      bg_color = '#0d1117',
      fg_color = '#6e7681',
    },
    new_tab_hover = {
      bg_color = '#1a1a2e',
      fg_color = '#c0c0c0',
    },
  },
}

-- Tab bar padding
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index + 1
  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end
  local prefix = tostring(index) .. ': '
  return {
    { Text = prefix .. title },
  }
end)

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

-- Search mode keybindings
config.key_tables = {
  search_mode = {
    -- Keep default search mode bindings
    { key = 'Enter', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatch' },
    { key = 'Enter', mods = 'SHIFT', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    { key = 'n', mods = 'CTRL', action = wezterm.action.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'r', mods = 'CTRL', action = wezterm.action.CopyMode 'CycleMatchType' },
    { key = 'u', mods = 'CTRL', action = wezterm.action.CopyMode 'ClearPattern' },
    { key = 'k', mods = 'CMD', action = wezterm.action.CopyMode 'ClearPattern' },
  },
}

config.keys = {
  -- Reload config
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },

  -- ===================
  -- SEARCH
  -- ===================
  -- Case-insensitive search by default
  {
    key = 'f',
    mods = 'CMD',
    action = wezterm.action.Search { CaseInSensitiveString = '' },
  },
  -- Fuzzy search scrollback with fzf (copies selection to clipboard)
  {
    key = 'f',
    mods = 'CMD|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local scrollback = pane:get_lines_as_text(pane:get_dimensions().scrollback_rows)
      local tmp = os.tmpname()
      local f = io.open(tmp, 'w')
      f:write(scrollback)
      f:close()
      window:perform_action(
        wezterm.action.SpawnCommandInNewTab {
          args = { '/bin/zsh', '-l', '-c', 'cat ' .. tmp .. ' | fzf --tac --no-sort --height=100% | pbcopy; rm ' .. tmp },
        },
        pane
      )
    end),
  },

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
  -- Rename tab (Cmd+Shift+E)
  {
    key = 'e',
    mods = 'CMD|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new tab name:',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

-- Finally, return the configuration to wezterm:
return config

