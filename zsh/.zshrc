#--------zinit--------#
declare -A ZINIT=([BIN_DIR]="$HOME/.local/share/zsh/bin" [HOME_DIR]="$HOME/.local/share/zsh/")
if [[ ! -f $ZINIT[BIN_DIR]/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command mkdir -p $ZINIT[HOME_DIR] && command chmod g-rwX $ZINIT[HOME_DIR]
  command git clone https://github.com/zdharma/zinit $ZINIT[BIN_DIR] && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
    print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$ZINIT[BIN_DIR]/zinit.zsh"

#--------plugins--------#
zinit light sindresorhus/pure
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

#--------plugin setting--------#

#--------zsh setting--------#
#alias
alias ls="ls -GF --color=auto"
if [ "$(uname)" = "Darwin" ];then;alias ls="ls -GF";fi
alias la="ls -la"
alias ytm="youtube-dl -f bestaudio -x --audio-format mp3"

#history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=100000

setopt hist_ignore_all_dups #ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space #スペースで始まるコマンド行はヒストリリストから削除
setopt hist_reduce_blanks  # 余分な空白は詰めて記録
setopt hist_save_no_dups # 古いコマンドと同じものは無視 
setopt inc_append_history # 履歴をインクリメンタルに追加

zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/zsh/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true1~

#comps
autoload -U compinit && compinit
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*:default' list-colors di=34 ex=32 '=*.c=35'
zstyle ':completion:*:default' menu select

#other
bindkey -v #vim like
bindkey "^R" history-incremental-search-backward

zmodload -i zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=2

# 補完時にhjklで選択
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

#cddの設定
function cdd() {
  target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
  target_dir=`echo ${target_dir/\~/$HOME}`
  if [ -n "$target_dir" ]; then
    cd $target_dir
  fi
}
zle -N cdd

fd() {
  cd $(find . -type d | fzf)
}
zle -N fd
