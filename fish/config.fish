#!/bin/fish

function fish_prompt
  printf (if fish_is_root_user
    echo '%s%s%s # '
  else
    echo '%s%s%s $ '
  end) \ (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs 5) (set_color normal)
end

function start_niri
  if systemctl --user -q is-active niri.service
    echo 'A Niri session is already running.'
    exit 1
  end
  systemctl --user reset-failed
  dbus-update-activation-environment --all
  systemctl --user --wait start niri.service
  systemctl --user start --job-mode=replace-irreversibly niri-shutdown.target
  systemctl --user unset-environment WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP NIRI_SOCKET
end

fish_add_path -p ~/.cargo/bin ~/.ghcup/bin
set -U fish_greeting
set EDITOR "neovim"
export DISPLAY=:0

if status is-login
  start_niri
  kill $fish_pid
end


# Created by `pipx` on 2025-05-03 19:57:49
set PATH $PATH /home/eric.marin/.local/bin
