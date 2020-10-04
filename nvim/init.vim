"-----Vim-Plug auto install-----"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-----Plugin-----"
call plug#begin(stdpath('data') . '/plugged')
"ColorScheme
Plug 'sainnhe/gruvbox-material'

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

"Complete
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'jiangmiao/auto-pairs'

"Looks
Plug 'bfrg/vim-cpp-modern'
Plug 'Yggdroot/indentLine'

"Add function
Plug 'markonm/traces.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
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

if exists('$TMUX') && !exists('$NORENAME') "vimでファイルを開いたときに、tmuxのwindow名にファイル名を表示
  au BufEnter * if empty(&buftype) | call system('tmux rename-window "nvim->"'.expand('%:t:S')) | endif
  au VimLeave * call system('tmux set-window automatic-rename on')
endif

"Edit
set expandtab "入力モードでTabキー押下時に半角スペースを挿入
set shiftwidth=2 "インデント幅
set softtabstop=2 "タブキー押下時に挿入される文字幅を指定
set tabstop=2 "ファイル内にあるタブ文字の表示幅
set autoindent "インデントを揃える
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"File
set noswapfile "スワップファイルを作成しない
set nowritebackup "ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

"-----KeyMap-----"
"nvim
let mapleader="\<Space>"

"easy-motion
let g:EasyMotion_do_mapping=0
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

"nerdtree
map <C-n> :NERDTreeToggle<CR>

"-----Plugin Setting-----"
"gruvbox-material
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

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

"fzf
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

set pumblend=16

"vim-lsp
let g:lsp_signs_error = {'text': '✗'}
if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c','cpp'],
        \ })
endif
if executable('pyls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> <leader>K <plug>(lsp-hover)
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"acynccomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
\ 'name': 'file',
\ 'whitelist': ['*'],
\ 'priority': 10,
\ 'completor': function('asyncomplete#sources#file#completor')
\ }))
