# For when you need to setup everything quickly
# For that  you'll need:

#  Git            https://git-scm.com/downloads/linux
#  Homebrew       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#  Fish Shell     $ brew install fish
#  GHQ             $ brew install ghq
function basic_custom_setup
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
        if not which -s $formulae
            brew install -q $formulae
        end
    end

    # sync_current_dotfiles
    fish_update_completions
end
