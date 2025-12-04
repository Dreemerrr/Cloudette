#!/bin/bash

WALLPAPER_DIR="$HOME/.config/wallpapers"

# Get all wallpapers (full paths)
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f | sort)

# Build menu with filenames only
FILENAME_LIST=$(for f in "${WALLPAPERS[@]}"; do basename "$f"; done)

# Show list in rofi
SELECTED_NAME=$(printf "%s\n" $FILENAME_LIST | rofi -dmenu -i -p "Select Wallpaper")

# Exit if nothing selected
[ -z "$SELECTED_NAME" ] && exit

# Convert filename back to full path
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_NAME"

# Apply wallpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$SELECTED_PATH"
hyprctl hyprpaper wallpaper "LVDS-1,$SELECTED_PATH"
