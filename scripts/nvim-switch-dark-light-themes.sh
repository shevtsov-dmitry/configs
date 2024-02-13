FILE_PATH=~/.config/nvim/lua/config/options.lua

LIGHT_CONFIG='vim.go.background = "light"'
DARK_CONFIG='vim.go.background = "dark"'

grep_light=$(grep "$FILE_PATH" -r -o -e "$LIGHT_CONFIG")
grep_dark=$(grep "$FILE_PATH" -r -o -e "$DARK_CONFIG")

if [[ "$grep_light" == "$LIGHT_CONFIG" ]]; then
	sed -i "s/$LIGHT_CONFIG/$DARK_CONFIG/" $FILE_PATH
	echo "dark mode set"
elif [[ "$grep_dark" == "$DARK_CONFIG" ]]; then
	sed -i "s/$DARK_CONFIG/$LIGHT_CONFIG/" $FILE_PATH
	echo "light mode set"
else
	echo "ERROR: Neovim. couldn't find the path to file.
    Path set in the script: $FILE_PATH"
fi
