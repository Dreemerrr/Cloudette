#!/bin/bash

chosen=$(printf " Lock\nReboot\nShutdown\nSuspend\nLogout" | rofi -dmenu -i -p "Power")

case $chosen in 
	"Lock") hyprlock ;;
	"Reboot") systemctl reboot ;; 
	"Shutdown") systemctl poweroff ;;
	"Suspend") systemctl suspend ;;
	"Logout") wlogout ;;

esac
