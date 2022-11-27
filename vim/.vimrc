let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" morhetz/gruvbox
set background=dark
color gruvbox
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode=1

" itchyny/lightline.vim
set laststatus=2
let g:lightline ={'colorscheme':'gruvbox'}

" prabirshrestha/vim-lsp
let g:mapleader="\<Space>"
nnoremap <Space>f :LspDocumentFormat<CR>
vnoremap <Space>f :LspDocumentRangeFormat<CR>
nnoremap <Space>i :LspHover<CR>
nnoremap <Space>d :LspDefinition<CR>
nnoremap <Space>l :LspDocumentSymbol<CR>
nnoremap <Space>w :LspNextDiagnostic<CR>
nnoremap <Space>r :LspRename<CR>
nnoremap <Space>s :LspStatus<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

set hlsearch
set incsearch
set smartcase
set listchars=tab:>-,trail:·
set list
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set termguicolors
set undodir=~/.cache/undo
set undofile
set lazyredraw

nnoremap <space>t :bnext<CR>
nnoremap <space>T :bprev<CR>
nnoremap <space>x :bdelete<CR>
