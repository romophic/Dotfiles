#!/bin/bash

echo -e \
  "  ____        _    __ _ _           \n"\
  "|  _ \  ___ | |_ / _(_) | ___  ___  \n"\
  "| | | |/ _ \| __| |_| | |/ _ \/ __| \n"\
  "| |_| | (_) | |_|  _| | |  __/\__ \ \n"\
  "|____/ \___/ \__|_| |_|_|\___||___/ \n"\
  "    Made by romophic MIT License    \n"\

# for xdg config
software_list=(
  "alacritty"
  "dunst"
  "git"
  "helix"
  "htop"
  "i3"
  "kitty"
  "mpv"
  "neofetch"
  "nvim"
  "polybar"
  "picom"
  "ranger"
  "rofi"
  "wezterm"
  "zellij"
)

for software in "${software_list[@]}"; do
  ln -s ~/Dotfiles/"$software"/* ~/.config/"$software"/
done

ln -s ~/Dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Dotfiles/vim/* ~/.vim/
ln -s ~/Dotfiles/zsh/.zshrc ~/.zshrc
