function sync_backup_dotfiles -d "Backup your current config files 󰕒 "
    cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/
    cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/
    cp -r ~/.config/yazi/theme.toml $(ghq root)/github.com/Kacaii/dotfiles/yazi
    cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles/tmux

    cp -r ~/.config/fish/functions/sync_backup_dotfiles.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/sync_current_dotfiles.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/uu.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/basic_custom_setup.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/fish_prompt.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/fish_right_prompt.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
end
