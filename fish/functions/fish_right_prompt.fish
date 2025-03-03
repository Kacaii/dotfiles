function fish_right_prompt
    set -l git_section (echo (string join "" (fish_git_prompt) (set_color red) "  " (set_color normal)))

    echo -n -s (date '+%H:%M') " "
end
