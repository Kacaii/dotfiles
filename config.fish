if status is-interactive

    # Disables fish_greeting 
    set -g fish_greeting ""
    set -gx TERM xterm-256color
    set -gx EDITOR nvim # Set EDITOR to nvim - 

    # Colored MAN Config 
    set -g man_bold -o cba7f7

    # Set up FZF integration 
    fzf --fish | source

    # Adding stuff to Path 
    fish_add_path /snap/bin
    fish_add_path /home/kacaii/custom-scripts/
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin
    fish_add_path /home/kacaii/go/bin/

    # Adding abbreviations
    abbr cls clear # Clear Screen - 
    abbr v nvim # Open nvim - 
    # abbr vv "nvim ." # Open current directory in neovim
    abbr fvv 'nvim $(fzf)' # Open file in neovim using fzf
    abbr g git # Git commands - 󰊢
    abbr gg lazygit # Open lazygit GUI - 󰊢
    abbr gp "git pull" # Pull - 󰊢
    abbr gc "ghq get" # Clone repository - 󰊢
    abbr tk "tmux kill-server" # Kill tmux server
    abbr pbat 'prettybat --color=always --theme="Catppuccin Mocha"' # Pretty Bat using Catppuccin Mocha theme
    abbr tt tmux # Shortcut to tmux 
    abbr fcc fish_clipboard_copy # Copy to clipboard
    abbr zbr 'zig build run' # 

    # Upgrade Packages and Updates Package Panager
    alias uu='\
      sudo apt update -y \
      && sudo apt full-upgrade -y \
      && brew upgrade \
      && ya pack -u'

    alias update_dotfiles='\
  cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/ \
  && cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/ \
  '

    alias fcg='nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    alias tcg='nvim ~/.tmux.conf' # Open tmux.conf in neovim
    # alias fzf='fzf  --preview "prettybat --style=numbers --color=always {}"'

    # Set up FZF colors
    set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --color=selected-bg:#45475a \
      --multi"

    function yy # Yazi Q setup 󰇥

        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"

    end

    # Prints all files in current directory in pretty bat format
    function bat_files

        for file in *
            if test -f $file
                bat -P --color=always --theme="Catppuccin Mocha" $file
            end
        end

    end

    # For when you need to setup everything quickly
    # For that  you'll need:
    #
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
            # brew install $formulae
            echo $formulae 
        end # End `for loop`

        fish_update_completions # 
        echo \n▒▒▒ All done!
    end
end
