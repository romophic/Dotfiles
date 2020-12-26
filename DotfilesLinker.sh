#!/bin/bash

echo -e \
  "  ____        _    __ _ _           \n"\
  "|  _ \  ___ | |_ / _(_) | ___  ___  \n"\
  "| | | |/ _ \| __| |_| | |/ _ \/ __| \n"\
  "| |_| | (_) | |_|  _| | |  __/\__ \ \n"\
  "|____/ \___/ \__|_| |_|_|\___||___/ \n"\
  "     Made by NULLCT© MIT License    \n"\

echo "Checking status..."
noerror=true

#Path
DIR=$(cd $(dirname $0); pwd)
DIR=${DIR#*/}
DIR=${DIR#*/}
DIR=${DIR#*/}
echo -n "Path: "
if test $DIR == "Dotfiles" ; then
  echo "✔"
else
  echo "✗"
  echo "  "$(cd $(dirname $0); pwd) "is not homefolder"
  noerror=false
fi

if "$noerror" ; then
  echo "Check complete!"
else
  echo -n "Found some errors\nSolve problems"
  exit
fi

echo -e "\nMaking links..."

#alacritty
echo "alacritty"
ln -sf ~/Dotfiles/alacritty/* ~/.config/alacritty/

#dunst
echo "dunst"
ln -sf ~/Dotfiles/dunst/* ~/.config/dunst/

#git
echo "git"
ln -sf ~/Dotfiles/git/* ~/.config/git/

#i3
echo "i3"
ln -sf ~/Dotfiles/i3/config ~/.config/i3/config

#neofetch
echo "neofetch"
ln -sf ~/Dotfiles/neofetch/* ~/.config/neofetch/

#nvim
echo "nvim"
ln -sf ~/Dotfiles/nvim/* ~/.config/nvim/

#polybar
echo "polybar"
ln -sf ~/Dotfiles/polybar/* ~/.config/polybar/

#picom
echo "picom"
ln -sf ~/Dotfiles/picom/* ~/.config/picom/

#ranger
echo "ranger"
ln -sf ~/Dotfiles/ranger/* ~/.config/ranger/

#rofi
echo "rofi"
ln -sf ~/Dotfiles/rofi/* ~/.config/rofi/

#tmux
echo "tmux"
ln -sf ~/Dotfiles/tmux/.tmux.conf ~/.tmux.conf

#vim
echo "vim"
ln -sf ~/Dotfiles/vim/.vimrc ~/.vimrc

#zsh
echo "zsh"
ln -sf ~/Dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Dotfiles/zsh/.zshenv ~/.zshenv
