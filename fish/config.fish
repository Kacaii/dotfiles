# Disabling Fish Greeting
set -g fish_greeting ""

set -gx EDITOR nvim
set -gx TERM xterm-256color

set -gx FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

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

    #  Edit Fish Config Files 
    bind ctrl-u "\
      nvim \
        ~/.config/fish/config.fish \
        ~/.config/fish/functions/fish_prompt.fish \
        ~/.config/fish/functions/fish_right_prompt.fish \
        ~/.config/fish/functions/sync_backup_dotfiles.fish \
        ~/.config/fish/functions/sync_current_dotfiles.fish"

    #  Git Prompt Customization
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_color red
    set -g __fish_git_prompt_color_dirtystate yellow
    set -g __fish_git_prompt_char_dirtystate 

    # Setup Shell integrations
    fzf --fish | source
    zoxide init fish | source

    # Regular Abbreviations
    abbr bat 'prettybat --color=always --theme="Catppuccin Mocha"'
    abbr c clear
    abbr fcc fish_clipboard_copy
    abbr man batman
    abbr v nvim
    abbr lla "ll -a"

    #  Git Abreviations
    abbr g git
    abbr gc "ghq get"
    abbr gg lazygit
    abbr gp "git pull"

    #  Zig Abbreviations
    abbr zbr "zig build run"
    abbr zbt "zig build test --summary all"

    #  Tmux Abbreviations
    abbr tk "tmux kill-server"
    abbr tm tmux

    #  Edit config files
    abbr fcg "nvim ~/.config/fish/config.fish" # Open config.fish in neovim
    abbr tcg "nvim ~/.tmux.conf" # Open tmux.conf in neovim

end
