############################
# .zshenv | Made by NULLCT #
############################
#パスを設定する
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#powerline-status
for DIR in ${HOME}/Library/Python/2.7/bin ${HOME}/.local/bin ; do
  if [ -d ${DIR} ] ; then
    PATH=${PATH}:${DIR}
  fi
done
