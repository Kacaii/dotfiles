function fish_prompt --description "Customize your prompt "
    set -l pwd_section ( echo  ( string join "" (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color normal) ) )
    set -l git_section (fish_git_prompt)

    set -l icon_section ""

    if test -e ./deno.json
        # Deno
        set -l deno_version_number (string split ' (' (deno --version))[1]

        set icon_section (echo (string join "" (set_color green) " [ " $deno_version_number "]" (set_color normal)))

        # NodeJS
    else if test -e ./package.json -a (pwd) != $HOME
        set icon_section (echo (string join "" (set_color green) " [ NodeJS " (node --version) "]" (set_color normal)))

        # Zig
    else if test -e ./src/main.zig
        set icon_section (echo (string join "" (set_color yellow) " [ Zig " (zig version) "]" (set_color normal)) )

        # Fish
    else if test (pwd) = $__fish_config_dir
        set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

    end

    echo -n -s " " $pwd_section $icon_section $git_section \n "  "
    # zig_custom_prompt
end
