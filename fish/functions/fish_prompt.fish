function fish_prompt --description "Customize your prompt "
    set -l pwd_section ( echo  ( string join "" (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color normal) ) )
    set -l git_section (fish_git_prompt)

    set -l icon_section ""
    if test -e ./deno.json
        set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

    else if test -e ./package.json -a (pwd) != $HOME
        set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

    else if test (pwd) = $__fish_config_dir
        set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

    end

    echo -n -s " " $pwd_section $icon_section $git_section "  "
end
