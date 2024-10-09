-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Oxocarbon Dark (Gogh)"
config.font = wezterm.font("Hack Nerd Font")
config.window_decorations = "NONE"
config.line_height = 1.2

config.keys = {

	-- Panes navigation
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Pane resize
	{
		key = "j",
		mods = "CTRL|ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},
	{
		key = "k",
		mods = "CTRL|ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		key = "h",
		mods = "CTRL|ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		key = "l",
		mods = "CTRL|ALT|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},

	-- Zoom
	{
		key = "z",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},

	-- Vi mode: copy
	{
		key = "v",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivateCopyMode,
	},

	-- Splits from tmux: % and "
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Workspaces/tabs navigation
	{
		key = "1",
		mods = "ALT",
		action = wezterm.action.ActivateTab(0),
	},

	{
		key = "2",
		mods = "ALT",
		action = wezterm.action.ActivateTab(1),
	},

	{
		key = "3",
		mods = "ALT",
		action = wezterm.action.ActivateTab(2),
	},

	{
		key = "4",
		mods = "ALT",
		action = wezterm.action.ActivateTab(3),
	},

	{
		key = "5",
		mods = "ALT",
		action = wezterm.action.ActivateTab(4),
	},

	{
		key = "6",
		mods = "ALT",
		action = wezterm.action.ActivateTab(5),
	},

	{
		key = "7",
		mods = "ALT",
		action = wezterm.action.ActivateTab(6),
	},

	{
		key = "8",
		mods = "ALT",
		action = wezterm.action.ActivateTab(7),
	},

	{
		key = "9",
		mods = "ALT",
		action = wezterm.action.ActivateTab(-1),
	},
}

-- and finally, return the configuration to wezterm
return config
