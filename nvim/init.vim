"-----Vim-Plug auto install-----"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-----Plugin-----"
call plug#begin(stdpath('data') . '/plugged')
"ColorScheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

"Status
Plug 'itchyny/lightline.vim'

"File explor
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'

"Complete
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',
                                       \ 'do': 'bash install.sh',
                                       \ 'for': ['cpp', 'python'] }
Plug 'jiangmiao/auto-pairs'

"Highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

"Add function
Plug 'markonm/traces.vim'
call plug#end()

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
set termguicolors "True Color
set title "タイトルを表示
set number "行番号の表示
set relativenumber "行番号を動的表示
set showcmd "ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set display=lastline "省略されずに表示
set noshowmode "lightlineの下のステータスを削除
augroup HighlightTrailingSpaces "行末のスペースを可視化
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"Edit
set expandtab "入力モードでTabキー押下時に半角スペースを挿入
set shiftwidth=2 "インデント幅
set softtabstop=2 "タブキー押下時に挿入される文字幅を指定
set tabstop=2 "ファイル内にあるタブ文字の表示幅
set autoindent "インデントを揃える
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"File
set noswapfile "スワップファイルを作成しない
set nowritebackup "ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

"-----Plugin Setting-----"
"gruvbox-material
set background=dark
colorscheme gruvbox-material

"lightline
let g:lightline = {
\ 'colorscheme': 'gruvbox_material',
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\ 'active': { 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ] }
\ }

"indentLine
let g:indentLine_color_term = 238
let g:indentLine_char = '¦' "use ¦, ┆ or │

"nerdtree
map <C-n> :NERDTreeToggle<CR>

"fzf
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"deoplete
let g:deoplete#enable_at_startup = 1
set pumblend=16

"languageclient-neovim
nmap <silent>K <Plug>(lcn-hover)
let g:LanguageClient_serverCommands = {
\ 'cpp' : ['clangd'],
\ 'python': ['pyls'],
\ }
