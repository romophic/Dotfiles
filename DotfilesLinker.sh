#!/bin/bash

echo -e \
  "  ____        _    __ _ _           \n"\
  "|  _ \  ___ | |_ / _(_) | ___  ___  \n"\
  "| | | |/ _ \| __| |_| | |/ _ \/ __| \n"\
  "| |_| | (_) | |_|  _| | |  __/\__ \ \n"\
  "|____/ \___/ \__|_| |_|_|\___||___/ \n"\
  "    Made by romophic MIT License    \n"\

#alacritty
ln -sf ~/Dotfiles/alacritty/* ~/.config/alacritty/

#dunst
ln -sf ~/Dotfiles/dunst/* ~/.config/dunst/

#git
ln -sf ~/Dotfiles/git/* ~/.config/git/

#helix
ln -sf ~/Dotfiles/helix/* ~/.config/helix/

#htop
ln -sf ~/Dotfiles/htop/* ~/.config/htop/

#i3
ln -sf ~/Dotfiles/i3/* ~/.config/i3/

#kitty
ln -sf ~/Dotfiles/kitty/* ~/.config/kitty/

#mpv
ln -sf ~/Dotfiles/mpv/* ~/.config/mpv/

#neofetch
ln -sf ~/Dotfiles/neofetch/* ~/.config/neofetch/

#nvim
ln -sf ~/Dotfiles/nvim/* ~/.config/nvim/

#polybar
ln -sf ~/Dotfiles/polybar/* ~/.config/polybar/

#picom
ln -sf ~/Dotfiles/picom/* ~/.config/picom/

#ranger
ln -sf ~/Dotfiles/ranger/* ~/.config/ranger/

#rofi
ln -sf ~/Dotfiles/rofi/* ~/.config/rofi/

#tmux
ln -sf ~/Dotfiles/tmux/.tmux.conf ~/.tmux.conf

#vim
ln -sf ~/Dotfiles/vim/.vimrc ~/.vimrc

#wezterm
ln -sf ~/Dotfiles/wezterm/* ~/.config/wezterm/

#zellij
ln -sf ~/Dotfiles/zellij/* ~/.config/zellij/

#zsh
ln -sf ~/Dotfiles/zsh/.zshrc ~/.zshrc
