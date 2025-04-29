# For when you need to setup everything quickly
# For that  you'll need:

#  Git            https://git-scm.com/downloads/linux
#  Homebrew       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#  Fish Shell     $ brew install fish
#  GHQ             $ brew install ghq
function basic_custom_setup
    # Homebrew Software
    set ensure_installed_homebrew \
        bat \
        batdiff \
        batgrep \
        batman \
        batpipe \
        batwatch \
        deno \
        docker \
        fd \
        fish \
        fish-lsp \
        fzf \
        gh \
        ghq \
        gleam \
        go \
        httpie \
        lazydocker \
        lazygit \
        lua \
        luarocks \
        node \
        nvim \
        prettybat \
        rg \
        sqlite3 \
        tmux \
        tree \
        tree-sitter \
        xclip \
        yazi \
        zig \
        zoxide

    # Install missing formulaes
    for formulae in $ensure_installed_homebrew
        if not type -q $formulae
            brew install -q $formulae
        end
    end

    if not type -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    end

    # Fisher Plugins
    set -l ensure_installed_fisher \
        jorgebucaran/fisher \
        jethrokuan/z \
        decors/fish-ghq \
        catppuccin/fish \
        decors/fish-colored-man \
        patrickf1/fzf.fish \
        jorgebucaran/autopair.fish

    for fisher_plugin in $ensure_installed_fisher
        # Install missing fisher plugins
        if not contains $fisher_plugin (cat $__fish_config_dir/fish_plugins)
            fisher install $fisher_plugin
        end
    end

end
