"      _       _ _         _           "
"     (_)_ __ (_) |___   _(_)_ __ ___  "
"    | | '_ \| | __\ \ / / | '_ ` _ \  "
"   | | | | | | |_ \ V /| | | | | | |  "
"  |_|_| |_|_|\__(_)_/ |_|_| |_| |_|   "

"-----Vim-Plug auto install-----"
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

"-----Plugin-----"
call plug#begin(stdpath('data') . '/plugged')
"ColorScheme
Plug 'sainnhe/gruvbox-material'

"Status
Plug 'vim-airline/vim-airline'

"File explor
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

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
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'

"Add function
Plug 'markonm/traces.vim'
Plug 'liuchengxu/vista.vim'
Plug 'luochen1990/rainbow'
call plug#end()

"--------Vim Setting--------"
"Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set nofoldenable

"Hightlight and Color
syntax on
set background=dark
set cursorline
set showmatch matchtime=1

"Look
set termguicolors
set title
set number
set relativenumber
set showcmd
set display=lastline
set pumblend=16
set noshowmode
set list
set listchars=tab:»\ ,trail:·

"Edit
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set clipboard+=unnamedplus
set undodir=~/.cache/vim/undo
set undofile

"File
set noswapfile
set nowritebackup
set nobackup

"-----KeyMap-----"
"nvim
let mapleader="\<Space>"

"airline
nmap <leader>T <Plug>AirlineSelectPrevTab
nmap <leader>t <Plug>AirlineSelectNextTab

"nerdtree
nmap <leader>n :NERDTreeToggle<CR>

"vim-lsp
nmap <leader>r <plug>(lsp-rename)
nmap <leader>i <plug>(lsp-hover)
nmap <leader>d <plug>(lsp-definition)
autocmd FileType c,cpp xmap = :LspDocumentRangeFormat<CR>
autocmd FileType c,cpp nmap == <S-V>:LspDocumentRangeFormat<CR>

"vista
nmap <leader>v :Vista!!<CR>

"ZEN
nmap <leader>zen :Goyo<CR>

"-----Plugin Setting-----"
"gruvbox-material
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"nerdtree
let g:NERDTreeShowHidden = 1

"indentLine
let g:indentLine_char = '⎸' "use ¦, ┆ or │

"fzf
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"vim-lsp
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
if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rls']},
        \ 'allowlist': ['rust'],
        \ })
endif
if executable('cmake-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'cmake-language-server',
        \ 'cmd': {server_info->['cmake-language-server']},
        \ 'allowlist': ['cmake'],
        \ 'initialization_options': {
        \   'buildDirectory': 'build',
        \ }
        \})
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"vista
let g:vista_default_executive = 'vim_lsp'

"rainbow
let g:rainbow_active = 1
