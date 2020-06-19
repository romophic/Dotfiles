#!/bin/sh

#alacritty
ln -sf ~/Dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

#git
ln -sf ~/Dotfiles/git_ignore ~/.config/git/ignore

#i3
ln -sf ~/Dotfiles/i3_config ~/.config/i3/config

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
