function fish_prompt
    printf '%s%s%s $ ' \ (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs 5) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    set -g fish_greeting ''
end
