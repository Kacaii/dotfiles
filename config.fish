if status is-interactive

    # Disables fish_greeting 
    set -g fish_greeting ""
    set -gx TERM xterm-256color

    # Adding stuff to Path  
    fish_add_path /snap/bin
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin

    # Adding abbreviations
    abbr cls clear # Clear Screen
    abbr v nvim
    abbr vv nvim . # Open current directory in neovim
    abbr fvv 'nvim $(fzf)' # Open file in neovim using fzf
    abbr g git
    abbr gp git pull
    abbr gc ghq get
    abbr gco git checkout
    abbr ls lsd
    abbr ll lsd -l
    abbr lla lsd -la
    abbr llt lsd --tree --depth 2 # Tree view
    abbr tk tmux kill-server # Kill tmux server
    abbr pbat 'prettybat --color=always --theme="Catppuccin Mocha"' # Pretty Bat using Catppuccin Mocha theme
    abbr tt tldr
    abbr fcc fish_clipboard_copy # Copy to clipboard

    # Adding alias
    alias uu='sudo apt update -y && sudo apt full-upgrade -y && brew upgrade' # Upgrade Packages and Updates Package Panager
    alias tss='tmux split-window -v -c "#{pane_current_path}"'
    alias tsv='tmux split-window -h -c "#{pane_current_path}"'
    alias fcg='nvim ~/.config/fish/config.fish' # Open config.fish in neovim
    alias tcg='nvim ~/.tmux.conf' # Open tmux.conf in neovim
    alias fzf='fzf --tmux 65% --preview "prettybat --style=numbers --color=always {}"'

    # Run `deno test` in a tmux session
    function start_tmux_deno_testing
        # Define the session name and window name
        set session_name deno_testing
        set window_name preview_tests

        # Create or attach to the session
        tmux new-session -A -d -s $session_name
        tmux new-window -t $session_name -n $window_name

        # Split the window vertically
        tmux split-window -v -t $session_name:$window_name

        # Run `deno test` in the preview window
        tmux send-keys -t deno_testing:preview_tests.1 'deno test -A --watch' Enter

        # Focus the upper pane
        tmux select-pane -t deno_testing:preview_tests.0
        #
        # Attach to the session
        tmux attach-session -t deno_testing
    end

    # Prints all files in current directory in pretty bat format
    function bat_files
        for file in *
            if test -f $file
                bat -P --color=always --theme="Catppuccin Mocha" $file
            end
        end
    end

    set -gx EDITOR nvim

    # Colored MAN Config ' 
    set -g man_bold -o cba7f7

    # Set up fzf integration
    fzf --fish | source

    # Set up fzf colors
    set -Ux FZF_DEFAULT_OPTS " \
                --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --color=selected-bg:#45475a \
        --multi"

    # Yazi 'Q' setup
    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

end
