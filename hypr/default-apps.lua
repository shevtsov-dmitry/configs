return {
	terminal = "alacritty",
	fileManager = "thunar",
	capturing = "grim -g $(slurp) - | swappy -f -",
	appLauncher = "rofi -show combi -modi window,drun,combi -combi-modi window,drun",
	idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'",
	browser = "google-chrome-stable",
}
