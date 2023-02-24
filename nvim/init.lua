local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
  { "ellisonleao/gruvbox.nvim",  event = "VeryLazy" },
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = true, dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        auto_install = true,
        ensure_installed = { "markdown", "markdown_inline" },
        highlight = {
          enable = true
        }
      }
    end
  },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim","neovim/nvim-lspconfig" }, config = function()
    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga goto_definition<CR>", bufopts)
      vim.keymap.set('n', '<leader>l', "<cmd>Lspsaga lsp_finder<CR>", bufopts)
      vim.keymap.set('n', '<leader>i', "<cmd>Lspsaga hover_doc<CR>", bufopts)
      vim.keymap.set('n', '<leader>r', "<cmd>Lspsaga rename<CR>", bufopts)
      vim.keymap.set('n', '<leader>e', "<cmd>Lspsaga show_buf_diagnostics<CR>", bufopts)
      vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end,
        bufopts)
    end
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup { on_attach = on_attach }
      end
    })
  end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "nvim_buffer" },
          { name = "nvim_path" },
          { name = "nvim_cmdline" }
        },
        mapping = cmp.mapping.preset.insert {},
        formatting = {
          format = require("lspkind").cmp_format {}
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        }
      }
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },
  { "stevearc/dressing.nvim",   config = true, event = "VeryLazy" },
  { "glepnir/lspsaga.nvim",     config = true, event = "VeryLazy" },
  { "ray-x/lsp_signature.nvim", config = true, event = "VeryLazy" },
  { "j-hui/fidget.nvim",        config = true, event = "VeryLazy" },
  { "nvim-tree/nvim-tree.lua",  config = true, cmd = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeToggle" } },
  { "akinsho/bufferline.nvim",  config = true, event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim",  config = true, event = "VeryLazy" },
  { "folke/lsp-colors.nvim",    config = true, event = "VeryLazy" },
  { "nvim-telescope/telescope.nvim", keys = { "<leader>o" }, dependencies = { "nvim-lua/plenary.nvim" }, config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>o', builtin.find_files)
  end },
  { "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy", config = true },
  { "petertriho/nvim-scrollbar",               event = "VeryLazy", config = true }
})

vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd.colorscheme("gruvbox")
vim.keymap.set('n', '<leader>n', "<cmd>NvimTreeToggle<CR>")
