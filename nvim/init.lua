-----------------------------------
--░▀█▀░█▀█░▀█▀░▀█▀░░░░█░░░█░█░█▀█--
--░░█░░█░█░░█░░░█░░░░░█░░░█░█░█▀█--
--░▀▀▀░▀░▀░▀▀▀░░▀░░▀░░▀▀▀░▀▀▀░▀░▀--
-----------------------------------
-- packer.nvim auto installer
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/vim-vsnip"
  use 'morhetz/gruvbox'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<space>i", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = on_attach
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  server:setup(opts)
end)

vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'
cmp.setup {
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
}
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  ignore_install = { "norg" },
  highlight = {
    enable = true,
  },
}
require('lualine').setup {}
require('nvim-autopairs').setup{}

-- neovim setting
vim.cmd('colorscheme gruvbox')
vim.o.relativenumber=true
vim.o.cursorline=true
vim.o.shiftwidth=2
vim.o.undofile=true
vim.o.termguicolors=true
