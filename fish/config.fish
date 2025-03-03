# @fish-lsp-disable 4004
if status is-interactive

    set -l ensure_fish_add_path \
        /home/kacaii/.bun/bin \
        /home/kacaii/.cargo/bin \
        /home/kacaii/.local/bin \
        /home/kacaii/custom-scripts/ \
        /home/kacaii/go/bin/ \
        /home/linuxbrew/.linuxbrew/bin \
        /home/linuxbrew/.linuxbrew/sbin \
        /snap/bin

    for required_path in $ensure_fish_add_path
        fish_add_path $required_path
    end

    # Disabling Greeting
    set -g fish_greeting ""
    bind ctrl-e 'nvim ~/.config/fish/config.fish'

    # Git Prompt Customization
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_color red
    set -g __fish_git_prompt_color_dirtystate yellow
    set -g __fish_git_prompt_char_dirtystate 

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

    # Regular Abbreviations
    abbr bat 'prettybat --color=always --theme="Catppuccin Mocha"'
    abbr c clear
    abbr fcc fish_clipboard_copy
    abbr man batman
    abbr v nvim

    #  Git Abreviations
    abbr g git
    abbr gc "ghq get"
    abbr gg lazygit
    abbr gp "git pull"

    #  Zig Abbreviations
    abbr zbr 'zig build run'
    abbr zbt 'zig build test'

    #  Tmux Abbreviations
    abbr tk "tmux kill-server"
    abbr tt tmux

    #  Edit config files
    abbr fcg 'nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    abbr tcg 'nvim ~/.tmux.conf' # Open tmux.conf in neovim

    # Setup PHP  / Laravel 
    fish_add_path /home/kacaii/.config/herd-lite/bin
    # @fish-lsp-disable-next-line 4004
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
