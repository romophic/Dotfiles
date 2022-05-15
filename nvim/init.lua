------------------------------------
--░▀█▀░█▀█░▀█▀░▀█▀░░░░█░░░█░█░█▀█░--
--░░█░░█░█░░█░░░█░░░░░█░░░█░█░█▀█░--
--░▀▀▀░▀░▀░▀▀▀░░▀░░▀░░▀▀▀░▀▀▀░▀░▀░--
------------------------------------
-- packer.nvim auto installer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- lsp&cmp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  -- looks
  use "ellisonleao/gruvbox.nvim"
  use "sainnhe/gruvbox-material"
  use "cocopon/iceberg.vim"
  use { "nvim-treesitter/nvim-treesitter", run = "TSUpdate" }
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use { "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use { "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons", config = function () require("alpha").setup(require("alpha.themes.startify").config) end}

  if packer_bootstrap then
    require("packer").sync()
  end
end)

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {}
  opts.on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<space>i", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  server:setup(opts)
end)

require("cmp").setup {
  sources = require("cmp").config.sources{
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
}
require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  }
}
require("lualine").setup {}
require("nvim-autopairs").setup{}
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}
require('bufferline').setup {
  options = {
    numbers = "both"
  }
}
require("nvim-tree").setup {}

-- neovim setting
vim.cmd[[
autocmd BufWritePost plugins.lua PackerCompile
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
nnoremap <space>t :bnext<CR>
nnoremap <space>T :bprev<CR>
nnoremap <space>x :bdelete<CR>
nnoremap <space>n :NvimTreeToggle<CR>
]]
-- screen
vim.o.termguicolors=true
vim.o.number=true
vim.o.relativenumber=true
vim.o.cursorline=true
vim.o.showmode=false
vim.o.pumblend=16
vim.o.winblend=16
vim.opt.list=true
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("tab:->")

-- edit
vim.o.shiftwidth=2
vim.o.smarttab=true
vim.o.expandtab=true
vim.o.tabstop=2
vim.o.shiftwidth=2

-- file
vim.o.undofile=true
