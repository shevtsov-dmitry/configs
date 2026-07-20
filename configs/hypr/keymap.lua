---------------------
---- KEYBINDINGS ----
---------------------
---
local default_apps = require("default-apps")

local mainMod = "SUPER"

-- Apps / Actions
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(default_apps.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(default_apps.fileManager))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(default_apps.capturing))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(default_apps.appLauncher))
hl.bind("CTRL + ALT + L", hl.dsp.dpms({ action = "off" }))

-- Window actions
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + G", hl.dsp.window.pin())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + S", hl.dsp.window.center())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Clipboard manager
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(default_apps.clipboard))

--------------------------
---- WINDOW GROUPING ----
--------------------------

-- hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprctl dispatch togglegroup"))
-- hl.bind("ALT + TAB", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive b"))
-- hl.bind("CTRL_R", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive b"))
-- hl.bind("ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive f"))

------------------------
---- VOLUME CONTROL ----
------------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(
		"amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
	),
	{ locked = true, repeating = true }
)

--------------------------
---- PLAYBACK CONTROL ----
--------------------------

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

----------------------------
---- SCREEN BRIGHTNESS ----
----------------------------

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-----------------------------
---- MOVE / RESIZE WINDOWS ---
-----------------------------

-- Mouse drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move windows with keyboard
local moveKeys = {
	{ "UP", "up" },
	{ "K", "up" },
	{ "DOWN", "down" },
	{ "J", "down" },
	{ "LEFT", "left" },
	{ "H", "left" },
	{ "RIGHT", "right" },
	{ "L", "right" },
}

for _, key in ipairs(moveKeys) do
	hl.bind(mainMod .. " + ALT + " .. key[1], hl.dsp.window.move({ direction = key[2] }))
end

---------------------
---- RESIZE MODE ----
---------------------

-- hl.submap("resize", function()
-- 	hl.bind("RIGHT", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 15 0"))
-- 	hl.bind("LEFT", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -15 0"))
-- 	hl.bind("UP", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -15"))
-- 	hl.bind("DOWN", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 15"))
--
-- 	hl.bind("L", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 15 0"))
-- 	hl.bind("H", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -15 0"))
-- 	hl.bind("K", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -15"))
-- 	hl.bind("J", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 15"))
--
-- 	hl.bind("ESCAPE", hl.dsp.submap("reset"))
-- end)
--
-- hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.submap("resize"))

------------------------
---- MOVE FOCUS ----
------------------------

local focusKeys = {
	{ "LEFT", "left" },
	{ "H", "left" },
	{ "RIGHT", "right" },
	{ "L", "right" },
	{ "UP", "up" },
	{ "K", "up" },
	{ "DOWN", "down" },
	{ "J", "down" },
}

for _, key in ipairs(focusKeys) do
	hl.bind(mainMod .. " + " .. key[1], hl.dsp.focus({ direction = key[2] }))
end

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

----------------------------------
---- MOVE TO WORKSPACE SILENT ----
----------------------------------

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

---------------------------
---- WORKSPACE ACTIONS ----
---------------------------

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Workspace scrolling
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("hyprctl dispatch workspace previous"))

-----------------------------
---- SPECIAL WORKSPACES ----
-----------------------------

hl.bind(mainMod .. " + ALT + MINUS", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))

hl.bind(mainMod .. " + ALT + EQUAL", hl.dsp.workspace.toggle_special("special"))

hl.bind(mainMod .. " + F1", hl.dsp.workspace.toggle_special("scratchpad"))

hl.bind(mainMod .. " + ALT + F1", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspacesilent special:scratchpad"))

-----------------------------
---- ADDITIONAL SETTINGS ----
-----------------------------

-- hl.settings({
-- 	binds = {
-- 		allow_workspace_cycles = 1,
-- 		workspace_back_and_forth = 0,
-- 		workspace_center_on = 1,
-- 		movefocus_cycles_fullscreen = true,
-- 		window_direction_monitor_fallback = true,
-- 	},
-- })
