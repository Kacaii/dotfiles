function sync_current_dotfiles -d 'Update your current config files 󰇚 '
    argparse h/help -- $argv or return

    # Handle displaying help message
    if set -q _flag_help
        echo TODO: help message 
        return 0
    end

    set -l ghq_dotfiles_root (ghq root)/github.com/Kacaii/dotfiles/

    cp -r $ghq_dotfiles_root/fish/config.fish $__fish_config_dir
    cp -r $ghq_dotfiles_root/nvim/lua/ ~/.config/nvim
    cp -r $ghq_dotfiles_root/nvim/snippets/ ~/.config/nvim
    cp -r $ghq_dotfiles_root/nvim/snippets/ ~/.config/nvim

    # Yazi directory needs to exist.
    if not test -e ~/.config/yazi
        mkdir ~/.config/yazi
    end
    cp -r $ghq_dotfiles_root/yazi/theme.toml ~/.config/yazi

    # Lazygit directory needs to exist.
    if not test -e ~/.config/lazygit
        mkdir ~/.config/lazygit
    end
    cp -r $ghq_dotfiles_root/lazygit/config.yml ~/.config/lazygit

    # Custom Fish Functions
    set -l custom_fish_functions \
        sync_backup_dotfiles.fish \
        sync_current_dotfiles.fish \
        uu.fish \
        basic_custom_setup.fish \
        fish_prompt.fish \
        fish_right_prompt.fish \
        y.fish

    for fn in $custom_fish_functions
        cp -r $ghq_dotfiles_root/fish/functions/$fn $__fish_config_dir/functions/
    end

end
