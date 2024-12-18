#! /bin/sh

poweroff=" Poweroff"
reboot=" Reboot"
lock=" Lock"
exit="󰗼 Exit"

chosen=$(echo -e "$poweroff\n$reboot\n$lock\n$exit" | fuzzel --dmenu --lines 4 --width 15)

case "$chosen" in
	"$poweroff") shutdown now ;;
	"$reboot") reboot ;;
	"$lock") loginctl lock-session ;;
	# "$exit") hyprctl dispatch exit ;;
        "$exit") niri msg action quit ;;
	*) exit 1 ;;
esac

