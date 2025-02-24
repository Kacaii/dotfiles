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


    # Setup shell integrations
    fzf --fish | source
    zoxide init fish | source

    # Setup PHP / Laravel
    fish_add_path /home/kacaii/.config/herd-lite/bin
    #
    # This file is part of the Symfony package.
    #
    # (c) Fabien Potencier <fabien@symfony.com>
    #
    # For the full copyright and license information, please view
    # https://symfony.com/doc/current/contributing/code/license.html

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


    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

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
            deno \
            docker \
            fd \
            fzf \
            gh \
            ghq \
            go \
            httpie \
            lazydocker \
            lazygit \
            lua \
            luarocks \
            neovim \
            node \
            php \
            ripgrep \
            sqlite \
            tmux \
            tree \
            tree-sitter \
            xclip \
            yazi \
            zig
        for formulae in $ensure_installed
            brew install $formulae
        end
    end

    # Copies nvim configuration
    function update_backup_dotfiles
        cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/
        cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles
        cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/
        cp -r ~/.config/yazi/theme.toml $(ghq root)/github.com/Kacaii/dotfiles/yazi
        cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles/tmux
    end

end
