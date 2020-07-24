"--------Vim Setting--------"
"Search
set ignorecase "検索するときに大文字小文字を区別しない
set smartcase "小文字で検索すると大文字と小文字を無視して検索
set incsearch "インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set hlsearch "検索結果をハイライト表示
set nofoldenable "検索にマッチした行以外を折りたたむ(フォールドする)機能

"Hightlight and Colors
syntax on "シンタックスハイライト
set background=dark "背景を暗くする
set cursorline "カーソルのある行を強調表示
set showmatch matchtime=1 "対応する括弧やブレースを表示

"View
set title "タイトルを表示
set number "行番号の表示
set relativenumber "行番号を動的表示
set showcmd "ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set display=lastline "省略されずに表示
set list "タブ文字を CTRL-I で表示し、行末に $ で表示する
set listchars=tab:»\ ,trail:~,space:･,eol:↲,extends:»,precedes:«,nbsp:% "行末のスペースを可視化
augroup HighlightTrailingSpaces "行末のスペースを可視化
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
augroup TransparentBG "背景透過
  autocmd!
  autocmd Colorscheme * highlight Normal ctermbg=NONE guibg=NONE
augroup END

"Edit
set expandtab "入力モードでTabキー押下時に半角スペースを挿入
set shiftwidth=2 "インデント幅
set softtabstop=2 "タブキー押下時に挿入される文字幅を指定
set tabstop=2 "ファイル内にあるタブ文字の表示幅
set autoindent "インデントを揃える
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
function! s:clang_format() "Cpp/Hppファイルをclang-formatで自動整形
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction
if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif

"File
set noswapfile "スワップファイルを作成しない
set nowritebackup "ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

"Complete
set completeopt=menuone,noinsert "補完

"Keymap

"Others

"--------Dein Script--------"
"let g:dein#auto_recache = 1 "リキャッシュ.
if &compatible
  set nocompatible
endif
"dein auto install
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
"load config file
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
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
filetype plugin indent on
