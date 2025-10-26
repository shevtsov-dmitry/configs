#!/bin/bash

# Get the current theme
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

# Define the light and dark themes
light_theme="Adwaita"
dark_theme="Adwaita-dark"

# Toggle the theme
if [[ "$current_theme" == *"$light_theme"* ]]; then
  gsettings set org.gnome.desktop.interface gtk-theme "$dark_theme"
else
  gsettings set org.gnome.desktop.interface gtk-theme "$light_theme"
fi
