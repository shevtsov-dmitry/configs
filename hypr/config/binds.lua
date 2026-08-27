local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + ALT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W", hl.dsp.layout("togglesplit"))

-- Change focus
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(noctCall .. "window-switcher"))

------------------------
---- QUICK RESIZE ----
------------------------

local resizeKeys = {
	{ "RIGHT", "15 0" },
	{ "L", "15 0" },
	{ "LEFT", "-15 0" },
	{ "H", "-15 0" },
	{ "UP", "0 -15" },
	{ "K", "0 -15" },
	{ "DOWN", "0 15" },
	{ "J", "0 15" },
}

for _, key in ipairs(resizeKeys) do
	hl.bind(mainMod .. " + CTRL + SHIFT + " .. key[1], hl.dsp.exec_cmd("hyprctl dispatch resizeactive " .. key[2]))
end

for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = "m~" .. i }))
end

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(launchPrefix .. EDITOR))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))
-- hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. "session lock"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"))

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------
-- Turn off monitors on Ctrl + Alt + L
hl.bind("CTRL + ALT + L", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "disable" }))
	end, { timeout = 500, type = "oneshot" })
end)

-- Focus on monitors
-- hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = MONITOR1 }))
-- hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor = MONITOR2 }))
-- hl.bind(mainMod .. " + 3", hl.dsp.focus({ monitor = MONITOR3 }))

-- Move to adjacent workspaces and next empty on a given monitor
-- hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "m+1" }))
-- hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "m-1" }))
-- hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "emptym" }))
--
-- Scroll through existing workspaces & monitors
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m-1" }))
-- hl.bind(mainMod .. " + CONTROL + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
-- hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m-1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())

local directionKeys = {
	{ "UP", "up" },
	{ "K", "up" },
	{ "DOWN", "down" },
	{ "J", "down" },
	{ "LEFT", "left" },
	{ "H", "left" },
	{ "RIGHT", "right" },
	{ "L", "right" },
}

-- Mouse drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- select workspace
for _, key in ipairs(directionKeys) do
	hl.bind(mainMod .. " + " .. key[1], hl.dsp.focus({ direction = key[2] }))
end

-- move to workspace silent
for _, key in ipairs(directionKeys) do
	hl.bind(mainMod .. " + ALT + " .. key[1], hl.dsp.window.move({ direction = key[2] }))
end

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- TODO rewrite using for loop
-- Move active window around workspaces
-- hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
-- hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
-- hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
-- hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
-- hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }))
-- hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Move active window around monitors
-- hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ monitor = MONITOR1 }))
-- hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ monitor = MONITOR2 }))
-- hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ monitor = MONITOR3 }))
-- hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ monitor = "+1" }))
-- hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ monitor = "-1" }))
