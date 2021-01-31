#--------zinit installer--------#
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

#--------zinit plugins--------#
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light sindresorhus/pure

#--------plugin setting--------#
#pure
PURE_PROMPT_SYMBOL="❯"
PURE_PROMPT_VICMD_SYMBOL="❮"
PURE_CMD_MAX_EXEC_TIME=1
zstyle :prompt:pure:git:stash show yes

#--------zsh setting--------#
if [ "$(uname)" = 'Darwin' ]; then #Mac
  export PATH="/usr/local/sbin:$PATH"
  alias ls="ls -GF"
else #Linux
  alias ls="ls -F --color=auto"
fi

alias la='ls -la'
alias ytm='youtube-dl --extract-audio --audio-format mp3'

#History and complete
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history         # コマンド履歴ファイルを共有する
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_expand # 補完時にヒストリを自動的に展開
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
zstyle ':completion:*:default' menu select #補間メニュー

bindkey -v #Like Vim
#cddの設定
autoload -Uz is-at-least
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*'      recent-dirs-max 500
zstyle ':chpwd:*'      recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
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

#View
setopt list_packed #補間候補を詰める
setopt list_types #補間候補一覧で種類を区別
autoload -Uz compinit #補完&色つけ
compinit

#Others
setopt auto_cd #フォルダ名だけで移動
setopt auto_pushd #移動履歴
