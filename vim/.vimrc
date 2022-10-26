let s:jetpack_root = expand('~/.cache/jetpack-vim')
let s:jetpack_vim = s:jetpack_root . '/jetpack.vim'
if !filereadable(s:jetpack_vim)
  execute '!curl -fLo' s:jetpack_vim '--create-dirs' 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
endif
execute 'source ' . s:jetpack_vim

call jetpack#begin(s:jetpack_root)
Jetpack 'morhetz/gruvbox'
Jetpack 'jiangmiao/auto-pairs'
Jetpack 'itchyny/lightline.vim'
Jetpack 'sheerun/vim-polyglot'
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'preservim/nerdtree'
call jetpack#end()

" morhetz/gruvbox
syntax enable
set background=dark
color gruvbox

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode=1

" itchyny/lightline.vim

" prabirshrestha/vim-lsp
let g:mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap  <Space>d <plug>(lsp-definition)
    nmap  <Space>s <plug>(lsp-document-symbol-search)
    nmap  <Space>S <plug>(lsp-workspace-symbol-search)
    nmap  <Space>r <plug>(lsp-references)
    nmap  <Space>i <plug>(lsp-implementation)
    nmap  <Space>t <plug>(lsp-type-definition)
    nmap  <Space><leader>rn <plug>(lsp-rename)
    nmap  <Space>g <plug>(lsp-previous-diagnostic)
    nmap  <Space>g <plug>(lsp-next-diagnostic)
    nmap  <Space>K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

set number

set hlsearch
set incsearch
set smartcase

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set termguicolors

nnoremap <space>t :bnext<CR>
nnoremap <space>T :bprev<CR>
nnoremap <space>x :bdelete<CR>
