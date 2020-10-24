############################
# .zshenv | Made by NULLCT #
############################
#Path
#clangd
if [ "$(uname)" = 'Darwin' ]; then #Mac
  export PATH="/usr/local/opt/llvm/bin:$PATH"
fi
#user bin
PATH="/Users/nari/.local/bin:$PATH"

#Others
export XDG_CONFIG_HOME="$HOME/.config" #.config/* 系の設定ファイルパス指定
