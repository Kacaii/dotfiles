function sync_backup_dotfiles -d "Backup your current config files 󰕒 "
    set -l ghq_dotfiles_root (ghq root)/github.com/Kacaii/dotfiles/

    cp -r $__fish_config_dir/config.fish $ghq_dotfiles_root/fish/
    cp -r ~/.config/nvim/lua/ $ghq_dotfiles_root/nvim/
    cp -r ~/.config/yazi/theme.toml $ghq_dotfiles_root/yazi
    cp -r ~/.tmux.conf $ghq_dotfiles_root/tmux

    # Custom Fish Functions
    set -l custom_fish_functions \
        sync_backup_dotfiles.fish \
        sync_current_dotfiles.fish \
        uu.fish \
        basic_custom_setup.fish \
        fish_prompt.fish \
        fish_right_prompt.fish

    for fn in $custom_fish_functions
        cp -r $__fish_config_dir/functions/$fn $ghq_dotfiles_root/fish/functions/
    end

    argparse h/help d/dir -- $argv or return

    # Handle displaying help message
    complete -c sync_backup_dotfiles -f --short-option h -d "Display Help "
    complete -c sync_backup_dotfiles -f --long-option help -d "Display Help "
    if set -q _flag_help
        echo TODO: help message 
        return 0
    end

    # Handle d/dir flag
    complete -c sync_backup_dotfiles -f --short-option d -d "Sync dotfiles and change directory"
    complete -c sync_backup_dotfiles -f --long-option dir -d "Sync dotfiles and change directory"
    if set -q _flag_dir
        cd $ghq_dotfiles_root
    end

end
