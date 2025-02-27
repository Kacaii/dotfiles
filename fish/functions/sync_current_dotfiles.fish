function sync_current_dotfiles -d "Update your current config files 󰇚 "
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/fish/config.fish ~/.config/fish/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/nvim/lua/ ~/.config/nvim/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/nvim/snippets/ ~/.config/nvim/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/yazi/theme.toml ~/.config/yazi/

    cp -r $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/sync_backup_dotfiles.fish ~/.config/fish/functions/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/sync_current_dotfiles.fish ~/.config/fish/functions/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/uu.fish ~/.config/fish/functions/
    cp -r $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/basic_custom_setup.fish ~/.config/fish/functions/
end
