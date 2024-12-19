#!/bin/fish

function fish_prompt
    printf '%s%s%s $ ' \ (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs 5) (set_color normal)
end

function start_niri
  # Make sure there's no already running session.
  if systemctl --user -q is-active niri.service
    echo 'A Niri session is already running.'
    exit 1
  end
  # Reset failed state of all user units
  systemctl --user reset-failed
  # Import the login manager environment.
  # systemctl --user import-environment
  # DBus activation environment is independent from systemd. While most of
  # dbus-activated services are already using `SystemdService` directive, some
  # still don't and thus we should set the dbus environment with a separate
  # command.
  dbus-update-activation-environment --all
  # Start niri and wait for it to terminate.
  systemctl --user --wait start niri.service
  # Force stop of graphical-session.target.
  systemctl --user start --job-mode=replace-irreversibly niri-shutdown.target
  # Unset environment that we've set.
  systemctl --user unset-environment WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP NIRI_SOCKET
end

fish_add_path -p ~/.cargo/bin ~/.ghcup/bin
set -U fish_greeting

if status is-login
  start_niri
  kill $fish_pid
end
