#!/bin/sh

#alacritty
ln -sf ~/Dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

#git
ln -sf ~/Dotfiles/git_ignore ~/.config/git/ignore

#i3
ln -sf ~/Dotfiles/i3_config ~/.config/i3/config

#rofi
ln -sf ~/Dotfiles/rofi_config ~/.config/rofi/config
ln -sf ~/Dotfiles/rofi_system.sh ~/.config/rofi/system.sh

#vim
ln -sf ~/Dotfiles/vimrc ~/.vimrc

#neovim
ln -sf ~/Dotfiles/neovim_init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/neovim_dein.toml ~/.config/nvim/dein.toml
ln -sf ~/Dotfiles/neovim_dein_lazy.toml ~/.config/nvim/dein_lazy.toml

#tmux
ln -sf ~/Dotfiles/tmux.conf ~/.tmux.conf

#zsh
ln -sf ~/Dotfiles/zshrc ~/.zshrc
ln -sf ~/Dotfiles/zshenv ~/.zshenv

#ranger
ln -sf ~/Dotfiles/ranger_commands.py ~/.config/ranger/commands.py
ln -sf ~/Dotfiles/ranger_commands_full.py ~/.config/ranger/commands_full.py
ln -sf ~/Dotfiles/ranger_rc.conf ~/.config/ranger/rc.conf
ln -sf ~/Dotfiles/ranger_rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/Dotfiles/ranger_scope.sh ~/.config/ranger/scope.sh
