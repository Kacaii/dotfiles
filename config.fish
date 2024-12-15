if status is-interactive

    # Disables fish_greeting 
    set -g fish_greeting ""
    set -gx TERM xterm-256color
    set -gx EDITOR nvim # Set EDITOR to nvim

    # Colored MAN Config  '
    set -g man_bold -o cba7f7

    # Set up FZF integration
    fzf --fish | source

    # Adding stuff to Path  
    fish_add_path /snap/bin
    fish_add_path /home/kacaii/.bun/bin
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /home/linuxbrew/.linuxbrew/sbin
    fish_add_path /home/kacaii/.cargo/bin
    fish_add_path /home/kacaii/.local/bin
    fish_add_path /home/kacaii/go/bin/

    # Adding abbreviations
    abbr cls clear # Clear Screen
    abbr v nvim # Open nvim
    # abbr vv "nvim ." # Open current directory in neovim
    abbr fvv 'nvim $(fzf)' # Open file in neovim using fzf
    abbr g git # Git commands
    abbr gg lazygit # Open lazygit GUI
    abbr gp "git pull" # Pull
    abbr gc "ghq get" # Clone repository
    abbr ls lsd # List directory
    abbr ll "lsd -l" # List directory in long format
    abbr lla "lsd -la" # List directory in long format with hidden files
    abbr llt "lsd --tree --depth 2" # List directory in tree format
    abbr tk "tmux kill-server" # Kill tmux server
    abbr pbat 'prettybat --color=always --theme="Catppuccin Mocha"' # Pretty Bat using Catppuccin Mocha theme
    abbr tt tldr # Shortcut to tldr
    abbr fcc fish_clipboard_copy # Copy to clipboard

    # Adding alias
    #
    # Upgrade Packages and Updates Package Panager
    alias uu='sudo apt update -y \
      && sudo apt full-upgrade -y \
      && brew upgrade \
      && ya pack -u'

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

    function yy # Yazi Q setup

        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"

    end

    # Run `deno test` in a tmux session
    function start_tmux_deno_testing

        # Define the session name and window name
        set -l session_name deno_testing
        set -l window_name preview_tests

        # Create or attach to the session
        tmux new-session -A -d -s $session_name
        tmux new-window -t $session_name -n $window_name

        # Split the window vertically
        tmux split-window -v -t $session_name:$window_name

        # Run `deno test` in the preview window
        tmux send-keys -t deno_testing:preview_tests.1 'deno test -A --watch' Enter

        # Focus the upper pane
        tmux select-pane -t deno_testing:preview_tests.0

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

    # Generates a PARA structure in the current directory or a specified directory.
    function generate_para

        # Set the base directory
        set -l base_dir (pwd)

        # Checks if a base directory is provided
        if test (count $argv) -gt 0
            set base_dir $argv[1]
        end

        # Create a base directory if it doesn't exist
        if not test -d $base_dir
            mkdir -p $base_dir
        end

        echo "Generating PARA structure in: $base_dir"

        # Define folder descriptions
        set -l para_folders "01 PROJECTS" "02 AREAS" "03 RESOURCES" "04 ARCHIVE"
        set -l para_descriptions \
            "Stores notes and files for active, time-bound tasks or deliverables." \
            "Contains ongoing responsibilities or areas of interest." \
            "Holds general reference materials and reusable templates." \
            "Keeps inactive projects and outdated resources for future reference."

        # Create folders and add README.md with descriptions
        for i in (seq (count $para_folders))
            set -l folder $para_folders[$i]
            set -l description $para_descriptions[$i]
            mkdir -p "$base_dir/$folder"
            echo "# $folder" >"$base_dir/$folder/README.md"
            echo "$description" >>"$base_dir/$folder/README.md"
        end

        echo "PARA Structure Generated Successfully! "

    end
end
