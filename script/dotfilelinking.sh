#!/bin/sh

#alacritty
ln -sf ~/Dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

#git
ln -sf ~/Dotfiles/git/ignore ~/.config/git/ignore

#i3
ln -sf ~/Dotfiles/i3/config ~/.config/i3/config

#rofi
ln -sf ~/Dotfiles/rofi/config ~/.config/rofi/config
ln -sf ~/Dotfiles/rofi/system.sh ~/.config/rofi/system.sh

#vim
ln -sf ~/Dotfiles/home/vimrc ~/.vimrc

#neovim
ln -sf ~/Dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/nvim/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/Dotfiles/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml

#tmux
ln -sf ~/Dotfiles/home/tmux.conf ~/.tmux.conf

#zsh
ln -sf ~/Dotfiles/home/zshrc ~/.zshrc
ln -sf ~/Dotfiles/home/zshenv ~/.zshenv

#ranger
ln -sf ~/Dotfiles/ranger/commands.py ~/.config/ranger/commands.py
ln -sf ~/Dotfiles/ranger/commands_full.py ~/.config/ranger/commands_full.py
ln -sf ~/Dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/Dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/Dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh
