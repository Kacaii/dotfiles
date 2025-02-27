# For when you need to setup everything quickly
# For that  you'll need:

#  Git            https://git-scm.com/downloads/linux
#  Homebrew       https://brew.sh/
#  Fish Shell     https://fishshell.com/

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
        brew install $formulae
    end
end
