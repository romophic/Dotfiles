###########################
# .zshrc | Made by NULLCT #
###########################

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

######
#Path#
######
#for mac clangd path
export PATH="$PATH:/usr/local/Cellar/llvm/10.0.0_3/bin"
#for pyenv setting
eval "$(pyenv init -)"

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
#パスとかの設定
export PATH="/usr/local/sbin:$PATH"
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#vi風のキーバインド
bindkey -v
#補完&色つけ
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
PURE_CMD_MAX_EXEC_TIME=0
