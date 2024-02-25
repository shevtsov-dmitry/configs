#!/bin/sh

FILE_PATH=~/.config/nvim/lua/config/options.lua

LIGHT_CONFIG='vim.go.background = "light"'
DARK_CONFIG='vim.go.background = "dark"'

grep_light=$(grep "$LIGHT_CONFIG" "$FILE_PATH")
grep_dark=$(grep "$DARK_CONFIG" "$FILE_PATH")

if [ -n "$grep_light" ]; then
	sed -i "s/$LIGHT_CONFIG/$DARK_CONFIG/" "$FILE_PATH"
	FILE_PATH=~/.config/nvim/lua/plugins/colorscheme.lua
	sed -i "s/colorscheme = \"melange\"/colorscheme = \"onedark\"/" "$FILE_PATH"
	echo "dark mode set"
elif [ -n "$grep_dark" ]; then
	sed -i "s/$DARK_CONFIG/$LIGHT_CONFIG/" "$FILE_PATH"
	FILE_PATH=~/.config/nvim/lua/plugins/colorscheme.lua
	sed -i "s/colorscheme = \"onedark\"/colorscheme = \"melange\"/" "$FILE_PATH"
	echo "light mode set"
else
	echo "ERROR: Neovim. couldn't find the path to file."
	echo "Path set in the script: $FILE_PATH"
fi
