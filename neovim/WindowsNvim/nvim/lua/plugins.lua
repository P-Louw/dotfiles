local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local setup_packer = require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use({ 'seblj/nvim-tabline', requires = { 'nvim-tree/nvim-web-devicons' } })
  use 'marko-cerovac/material.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'rktjmp/lush.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'zenbones-theme/zenbones.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  --use 'Yggdroot/indentLine'
  use "lukas-reineke/indent-blankline.nvim"
  use 'tpope/vim-surround'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'jeffkreeftmeijer/vim-numbertoggle'

  use 'tpope/vim-eunuch'
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-dispatch'
  use 'radenling/vim-dispatch-neovim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'mfussenegger/nvim-dap'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'ionide/Ionide-vim'
  use 'ziglang/zig.vim'
  use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })

  use 'Olical/conjure'
  use 'clojure-vim/clojure.vim'
  use 'PaterJason/cmp-conjure'
  use 'clojure-vim/vim-jack-in'
  use 'guns/vim-sexp'
  use 'tpope/vim-sexp-mappings-for-regular-people'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'tpope/vim-fugitive'
  --use 'airblade/vim-gitgutter'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return setup_packer
