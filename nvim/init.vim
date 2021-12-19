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
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

"File explor
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Complete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'jiangmiao/auto-pairs'

"Looks
let g:polyglot_disabled = ['markdown']
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
set winblend=16
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

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"nerdtree
let g:NERDTreeShowHidden = 1

"indentLine
let g:indentLine_char = '⎸' "use ¦, ┆ or │

"asyncomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))

"vista
let g:vista_default_executive = 'vim_lsp'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

"rainbow
let g:rainbow_active = 1

