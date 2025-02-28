# @fish-lsp-disable 4004
if status is-interactive

    # Path 󰅨
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin
    fish_add_path /home/kacaii/custom-scripts/
    fish_add_path /home/kacaii/go/bin/
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /snap/bin

    set -g fish_greeting ""

    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_color red
    set -g __fish_git_prompt_color_dirtystate yellow
    set -g __fish_git_prompt_char_dirtystate 

    # @fish-lsp-disable-next-line 4004
    function fish_prompt
        set -l icon_section ""
        set -l pwd_section (echo (string join "" (set_color blue) (prompt_pwd --full-length-dirs 2) (set_color normal)))

        if test -e ./deno.json
            set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

        else if test -e ./package.json -a (pwd) != $HOME
            set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

        else if test (pwd) = $__fish_config_dir
            set icon_section (echo (string join "" (set_color green) " " (set_color normal)))

        end

        echo -n -s " " $pwd_section $icon_section "  "
    end

    function fish_right_prompt
        set -l git_section ""

        set git_section (echo (string join "" (fish_git_prompt) (set_color red) "  " (set_color normal)))

        echo -n -s $git_section (date '+%H:%M') " "
    end

    set -gx EDITOR nvim
    set -gx TERM xterm-256color

    set -gx FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

    # Setup Shell integrations
    fzf --fish | source
    zoxide init fish | source

    abbr c clear
    abbr fcc fish_clipboard_copy

    abbr v nvim
    abbr bat 'prettybat --color=always --theme="Catppuccin Mocha"'
    abbr man batman

    #  Git abreviations
    abbr g git
    abbr gc "ghq get"
    abbr gg lazygit
    abbr gp "git pull"

    #  Zig Abbreviations
    abbr zbr 'zig build run'
    abbr zbt 'zig build test'

    #  Tmux abbreviations
    abbr tk "tmux kill-server"
    abbr tt tmux

    #  Edit config files
    abbr fcg 'nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    abbr tcg 'nvim ~/.tmux.conf' # Open tmux.conf in neovim

    # Setup PHP  / Laravel 
    fish_add_path /home/kacaii/.config/herd-lite/bin
    function _sf_laravel
        set sf_cmd (commandline -o)
        set c (count (commandline -oc))
        set completecmd "$sf_cmd[1]" _complete --no-interaction -sfish -a1

        for i in $sf_cmd
            if [ $i != "" ]
                set completecmd $completecmd "-i$i"
            end
        end

        set completecmd $completecmd "-c$c"

        $completecmd
    end
    complete -c laravel -a '(_sf_laravel)' -f

end
