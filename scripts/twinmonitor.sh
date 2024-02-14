FILE_PATH=~/.config/sway/config

grep_enabled=$(grep "$FILE_PATH" -r -o -e "enable")
grep_disabled=$(grep "$FILE_PATH" -r -o -e "disable")

if [[ "$grep_enabled" == "enable" ]]; then
	sed -i "s/enable/disable/" $FILE_PATH
	echo "Disable second monitor. Reload sway."
elif [[ "$grep_disabled" == "disable" ]]; then
	sed -i "s/disable/enable/" $FILE_PATH
	echo "Enable second monitor. Reload sway."
else
	echo "ERROR: couldn't find the path to file.
    Path set in the script: $FILE_PATH"
fi
