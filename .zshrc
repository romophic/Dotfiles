#########################
# .zshrc | Made by NULLCT#
#########################

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
zinit light sindresorhus/pure
zinit light rupa/z

#########
# Alias #
#########
#lsのカスタム(フォルダに/引いたり...)
alias ls="ls -GF"
#省略
alias la='ls -la'
#長いから省略
alias ytm='youtube-dl --extract-audio --audio-format mp3'

##############
#Other config#
##############
#文字化けの回避
export LANG=ja_JP.UTF-8
#パスとかの設定
export PATH="/usr/local/sbin:$PATH"
#補完
autoload -Uz compinit
compinit
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#vi風のキーバインド
#bindkey -v
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
