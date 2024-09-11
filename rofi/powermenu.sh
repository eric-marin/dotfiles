#! /bin/sh

poweroff=""
reboot=""
lock=""
exit="󰗼"

chosen=$(echo -e "$poweroff\n$reboot\n$lock\n$exit" | rofi -dmenu -theme powermenu.rasi)

case "$chosen" in
	"$poweroff") shutdown now ;;
	"$reboot") reboot ;;
	"$lock") loginctl lock-session ;;
	"$exit") hyprctl dispatch exit ;;
	*) exit 1 ;;
esac

