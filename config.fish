if status is-interactive

    set -g fish_greeting "" # Disables fish_greeting 
    set -gx TERM xterm-256color

    set -gx EDITOR nvim
    abbr v nvim # 

    # Adding stuff to Path 
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin
    fish_add_path /home/kacaii/custom-scripts/
    fish_add_path /home/kacaii/go/bin/
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /snap/bin

    # Colored MAN Config 
    set -g man_bold -o cba7f7

    # VM 1604 OK
    # VM 1402 OK

    # Set up FZF integration 
    fzf --fish | source

    # Set up FZF colors
    set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

    abbr cls clear # Clear Screen 
    abbr fcc fish_clipboard_copy # Copy to clipboard

    abbr pbat 'prettybat --color=always --theme="Catppuccin Mocha"' # Pretty Bat using Catppuccin Mocha theme

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

    # Upgrade Packages and Updates Package Panager
    function uu
        sudo apt update -y
        sudo apt full-upgrade -y
        brew upgrade
        ya pack -u
        fisher update
    end

    alias fcg='nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    alias tcg='nvim ~/.tmux.conf' # Open tmux.conf in neovim

    function yy # Yazi Q setup 󰇥
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Copies nvim configuration
    function update_backup_dotfiles
        cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/
        cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/
        cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles/
        cp -r ~/.config/yazi/theme.toml $(ghq root)/github.com/Kacaii/dotfiles/yazi
    end

    # For when you need to setup everything quickly
    # For that  you'll need:

    # - Git            https://git-scm.com/downloads/linux
    # - Homebrew       https://brew.sh/
    # - Fish Shell     https://fishshell.com/
    function basic_custom_setup

        # Add essential software here
        set ensure_installed \
            bat \
            bat-extras \
            curl \
            deno \
            fd \
            fzf \
            gh \
            ghq \
            glow \
            go \
            httpie \
            lazygit \
            lua \
            luarocks \
            neovim \
            ripgrep \
            sqlite \
            tmux \
            tree \
            tree-sitter \
            yazi \
            zig

        for formulae in $ensure_installed
            brew install $formulae
        end

        fish_update_completions
        echo \n▒▒▒ All done!
    end
end
