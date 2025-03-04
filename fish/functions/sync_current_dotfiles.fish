function sync_current_dotfiles -d "Update your current config files 󰇚 "
    set -l ghq_dotfiles_root (ghq root)/github.com/Kacaii/dotfiles/

    cp -r $ghq_dotfiles_root/fish/config.fish $__fish_config_dir/
    cp -r $ghq_dotfiles_root/nvim/lua/ ~/.config/nvim/
    cp -r $ghq_dotfiles_root/nvim/snippets/ ~/.config/nvim/
    cp -r $ghq_dotfiles_root/yazi/theme.toml ~/.config/yazi/

    cp -r $ghq_dotfiles_root/fish/functions/sync_backup_dotfiles.fish $__fish_config_dir/functions/
    cp -r $ghq_dotfiles_root/fish/functions/sync_current_dotfiles.fish $__fish_config_dir/functions/
    cp -r $ghq_dotfiles_root/fish/functions/uu.fish $__fish_config_dir/functions/
    cp -r $ghq_dotfiles_root/fish/functions/basic_custom_setup.fish $__fish_config_dir/functions/
    cp -r $ghq_dotfiles_root/fish/functions/fish_prompt.fish $__fish_config_dir/functions/
    cp -r $ghq_dotfiles_root/fish/functions/fish_right_prompt.fish $__fish_config_dir/functions/
end
