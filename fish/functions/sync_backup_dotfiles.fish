function sync_backup_dotfiles -d "Backup your current config files 󰕒 "
    set -l ghq_dotfiles_root (ghq root)/github.com/Kacaii/dotfiles/

    cp -r $__fish_config_dir/config.fish $ghq_dotfiles_root/fish/
    cp -r ~/.config/nvim/lua/ $ghq_dotfiles_root/nvim/
    cp -r ~/.config/yazi/theme.toml $ghq_dotfiles_root/yazi
    cp -r ~/.tmux.conf $ghq_dotfiles_root/tmux

    cp -r $__fish_config_dir/functions/sync_backup_dotfiles.fish $ghq_dotfiles_root/fish/functions/
    cp -r $__fish_config_dir/functions/sync_current_dotfiles.fish $ghq_dotfiles_root/fish/functions/
    cp -r $__fish_config_dir/functions/uu.fish $ghq_dotfiles_root/fish/functions/
    cp -r $__fish_config_dir/functions/basic_custom_setup.fish $ghq_dotfiles_root/fish/functions/
    cp -r $__fish_config_dir/functions/fish_prompt.fish $ghq_dotfiles_root/fish/functions/
    cp -r $__fish_config_dir/functions/fish_right_prompt.fish $ghq_dotfiles_root/fish/functions/
end
