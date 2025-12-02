#!/bin/fish

function fish_prompt
  printf (if fish_is_root_user
    echo '%s%s%s # '
  else
    echo '%s%s%s $ '
  end) \ (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs 5) (set_color normal)
end

fish_add_path -p ~/.cargo/bin ~/.ghcup/bin
set -U fish_greeting
set EDITOR "neovim"

if status is-login
	killall ssh-agent 1> /dev/null 2>&1
	eval (ssh-agent -c) 1> /dev/null 2>&1
	ssh-add ~/.ssh/zenbook 1> /dev/null 2>&1
	exec niri-session -l 1> /dev/null 2>&1
end

zoxide init fish | source
