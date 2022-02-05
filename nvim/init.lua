-----------------------------------
--░▀█▀░█▀█░▀█▀░▀█▀░░░░█░░░█░█░█▀█--
--░░█░░█░█░░█░░░█░░░░░█░░░█░█░█▀█--
--░▀▀▀░▀░▀░▀▀▀░░▀░░▀░░▀▀▀░▀▀▀░▀░▀--
-----------------------------------
-- packer.nvim auto installer
if vim.fn.empty(vim.fn.glob(vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim")) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
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
  use "ellisonleao/gruvbox.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }}
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }

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
  },
}
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  ignore_install = { "norg" },
  highlight = {
    enable = true,
  },
}
require("lualine").setup {}
require("nvim-autopairs").setup{}
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}
require('bufferline').setup {
  options = {
    numbers = "both"
  }
}

-- neovim setting
vim.cmd[[
colorscheme gruvbox
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
autocmd BufWritePost plugins.lua PackerCompile
nnoremap <space>t :bnext<CR>
nnoremap <space>T :bprev<CR>
]]
vim.o.relativenumber=true
vim.o.cursorline=true
vim.o.shiftwidth=2
vim.o.undofile=true
vim.o.termguicolors=true
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.completeopt="menu,menuone,noselect"
vim.o.pumblend=16
vim.o.winblend=16
vim.opt.list=true
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("tab:->")
vim.o.clipboard="unnamedplus"
