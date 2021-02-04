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
Plug 'halkn/lightline-lsp'

"File explor
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree',
Plug 'ryanoasis/vim-devicons',

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
language messages en_US.UTF-8

"Edit
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set clipboard+=unnamedplus
set undodir=~/.vim/undo
set undofile
autocmd FileType python set shiftwidth=2 tabstop=2 expandtab

"File
set noswapfile
set nowritebackup
set nobackup

"-----KeyMap-----"
"nvim
let mapleader="\<Space>"

"nerdtree
map <Leader>n :NERDTreeToggle<CR>

"vim-lsp
nmap <buffer> <leader>r <plug>(lsp-rename)
nmap <buffer> <leader>i <plug>(lsp-hover)

"vista
map <Leader>v :Vista!!<CR>

"ZEN
map <Leader>zen :Goyo<CR>

"-----Plugin Setting-----"
"gruvbox-material
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

highlight Normal      ctermbg=NONE guibg=NONE
highlight NonText     ctermbg=NONE guibg=NONE
highlight LineNr      ctermbg=NONE guibg=NONE
highlight Folded      ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

"lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'component_expand': {
      \   'lsp_warnings': 'lightline_lsp#warnings',
      \   'lsp_errors':   'lightline_lsp#errors',
      \   'lsp_ok':       'lightline_lsp#ok',
      \ },
      \ 'component_type': {
      \   'lsp_warnings': 'warning',
      \   'lsp_errors':   'error',
      \   'lsp_ok':       'middle',
      \ },
      \
      \ 'active': {
      \   'right': [
      \     [ 'lsp_errors', 'lsp_warnings', 'lsp_ok' ],
      \     [ 'percent', 'lineinfo' ],
      \     [ 'fileformat', 'fileencoding', 'filetype'  ],
      \   ],
      \ },
      \ }

"nerdtree
let g:NERDTreeShowHidden = 1

"indentLine
let g:indentLine_char = '¦' "use ¦, ┆ or │

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
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
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

"vista
let g:vista_default_executive = 'vim_lsp'
let g:vista_icon_indent = ["╰ ", "├ "]

"rainbow
let g:rainbow_active = 1
