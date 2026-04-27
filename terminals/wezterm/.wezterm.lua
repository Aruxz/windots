local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 1. Boot straight into Nushell
config.default_prog = { "nu.exe" }

-- 2. Font Rendering (The "Fix")
-- We use 'FiraCode NF' which is often the specific Windows name for the Choco install
-- We also strictly set the line height to 1.0 to stop the "text going up"
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font",
	"FiraCode NF",
	"JetBrains Mono", -- Fallback just in case
})
config.font_size = 13.0
config.line_height = 1.0
config.cell_width = 1.0
config.freetype_load_target = "Light" -- Makes font look crisp like Linux
config.front_end = "OpenGL" -- Better performance on Windows

-- 3. Colors (Strict Kitty Clone)
-- Your Kitty bg is #1E1B26 (Dark Purple). If you hate purple, change this to #000000.
config.colors = {
	foreground = "#C8C5D4",
	background = "#1E1B26",
	cursor_bg = "#F7AFFF",
	cursor_fg = "#1E1B26",
	selection_fg = "#1E1B26",
	selection_bg = "#C99CFF",
	ansi = { "#2B2B2B", "#D16D9E", "#A3BE8C", "#EBCB8B", "#81A1C1", "#C586C0", "#8FBCBB", "#EDEDED" },
	brights = { "#4C4C4C", "#E09EFF", "#B694F6", "#D6A8FF", "#C56FFF", "#F7AFFF", "#BA9CF9", "#FFFFFF" },
}

-- 4. Window Decorations (Clean Look)
config.window_decorations = "TITLE | RESIZE"
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
-- Set Opacity to 1.0.
-- Transparency on Windows without a blur filter looks "dirty/washed out" compared to Linux.
config.window_background_opacity = 1.0

-- 5. Keybinds & Cursor
config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 500
config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.ToggleFullScreen },
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
}

return config
