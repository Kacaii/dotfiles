function sync_backup_dotfiles -d "Backup your current config files 󰕒 "
    cp -r ~/.config/fish/config.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/ #       Fish
    cp -r ~/.config/nvim/lua/ $(ghq root)/github.com/Kacaii/dotfiles/nvim/ #         Nvim
    cp -r ~/.config/yazi/theme.toml $(ghq root)/github.com/Kacaii/dotfiles/yazi #   󰇥 Yazi Theme
    cp -r ~/.tmux.conf $(ghq root)/github.com/Kacaii/dotfiles/tmux #                 Tmux

    cp -r ~/.config/fish/functions/sync_backup_dotfiles.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
    cp -r ~/.config/fish/functions/sync_current_dotfiles.fish $(ghq root)/github.com/Kacaii/dotfiles/fish/functions/
end
