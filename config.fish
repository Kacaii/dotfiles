if status is-interactive

    set -g fish_greeting ""
    set -gx TERM xterm-256color
    set -gx EDITOR nvim

    set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

    # Adding stuff to Path 
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin
    fish_add_path /home/kacaii/custom-scripts/
    fish_add_path /home/kacaii/go/bin/
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /snap/bin

    # Set up FZF integration 
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

    alias fcg='nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    alias tcg='nvim ~/.tmux.conf' # Open tmux.conf in neovim

    # Upgrade Packages and Updates Package Panager
    function uu
        sudo apt update -y
        sudo apt full-upgrade -y
        brew upgrade
        ya pack -u
        fisher update
    end

    # Copies nvim configuration
    function update_backup_dotfiles
        cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/
        cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles
        cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/
        cp -r ~/.config/yazi/theme.toml $(ghq root)/github.com/Kacaii/dotfiles/yazi
        cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles/tmux
    end

    function yy # Yazi Q setup 󰇥
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end
