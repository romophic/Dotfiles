###########################################
#  ↓in .zshenv↓                           #
#  export XDG_CONFIG_HOME="$HOME/.config" #
#  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"  #
###########################################

###################
#Zinit's installer#
###################
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
  print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
  print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#################
#Zinit's plugins#
#################
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
  atpull"%atclone" make pick"src/vim"
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras
zinit light rupa/z
zinit light mafredri/zsh-async
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light chrissicool/zsh-256color
zinit light zsh-users/zsh-history-substring-search

#########
# Alias #
#########
#凡長だったので省略
alias ytm='youtube-dl --extract-audio --audio-format mp3'
#lsのカスタム(フォルダに/引いたり...)
alias ls="ls -GF"
#省略
alias la='ls -la'

##############
#Other config#
##############
#文字化けの回避
export LANG=ja_JP.UTF-8
#パスとかの設定
export PATH="/usr/local/sbin:$PATH"
#起動時にtmuxを実行
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
#補完
autoload -Uz compinit
compinit
# ヒストリの設定
HISTFILE=~/.config/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#vi風のキーバインド
bindkey -v
#補完候補を一覧表示にする
setopt auto_list
#TABで順に補完候補を切り替える
setopt auto_menu
#補完候補を一覧表示したとき、TABとか矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1
#補完候補の色付け
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#パスをフォルダ名だけで移動できるようになる？z的な
setopt auto_cd
#ヒストリーをシェアする
setopt share_history
#既にtmuxが起動していた際はそれにアタッチする
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  else
    tmux
  fi
fi
