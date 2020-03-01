""""""""""""""""""""""""""""""""""""""
"1>_Made by NULLCT Neovim config files"
""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein install command
" $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" $ sh ./installer.sh ~/.cache/dein
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
"Configs"
"""""""""
"init.vimの文字コードをUTF-8にする
scriptencoding utf-8
"vim内部文字コードをUTF-8にする
set encoding=utf-8
"ファイル保存時の文字コードをUTF-8にする
set fileencoding=utf-8
"左側に何行目かを表示する
set number
"編集行をハイライトする
set cursorline
"編集列をハイライトする
set cursorcolumn
"ビープ音を可視化する(画面をフラッシュする)
set visualbell
"ファイル名タブ補完の動作設定で、マッチするものをリスト表示する
set wildmode=list:longest
"カレント行のインデントをキープする
set autoindent
"タブをスペース何文字分にするか
set tabstop=2
"Enderや<<の入力の際、スペース何文字分挿入するか
set shiftwidth=2
"Tabを押したときにスペースを何個分挿入するか
set softtabstop=0
"行頭でshiftwidth分のスペースを挿入する
set smarttab
"すでにスペースがある際、shiftwidthの倍数になるように調整してくれる
set shiftround
"Tabを押した際、スペースを何個分挿入するか
set expandtab
"新しいウィンドウを右に開く
set splitright
"クリップボードとyankを同期する
set clipboard=unnamed
"タイトルの表示
set title
"マウス操作する
set mouse=a
"検索結果をハイライトする
set hlsearch
":bをしたときの警告を消してくれる
set hidden
"ファイルに外部からの変更が合った時に読み直す
set autoread
"バックアップを作成しない
set nobackup
"検索時に大文字小文字の区別をしない
set ignorecase
"小文字で検索すると大文字小文字を無視する
set smartcase
"検索が末尾まで進んだら最初に戻る
set wrapscan
"インクリメンタルサーチする
set incsearch
"プラグイン自動更新
let g:dein#auto_recache = 1
"エラー時の音を鳴らさない
set noerrorbells
"行をまたいで左右移動できる
set whichwrap=b,s,h,l,<,>,[,],~
"deinの読み込み
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"インデントのロードを有効化
filetype plugin indent on
"対応するカッコを強調表示
set showmatch
"行末の空白文字をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"挿入モードからノーマルモードへ移行する際のラグをなくす
set timeoutlen=0 ttimeoutlen=0
"背景を透明化させる
autocmd Colorscheme * highlight Normal ctermbg=none
"lightline用。モードを非表示にする
set noshowmode
""" markdown {{{
  autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
  autocmd BufRead,BufNewFile *.md  set filetype=markdown
  " Need: kannokanno/previm
  nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
  " 自動で折りたたまないようにする
  let g:vim_markdown_folding_disabled=1
" }}}

"""""""""""
"Keymaping"
"""""""""""
"バッファ切り替え
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
"Leaderをスペースキーにする
let mapleader = "\<Space>"
"端に移動
noremap <S-h> ^
noremap <S-l> $
noremap <S-k> 5k
noremap <S-j> 5j
nnoremap == gg=G''

""""""""
"Others"
""""""""
"call dein#update()
if &compatible
  set nocompatible
endif
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
