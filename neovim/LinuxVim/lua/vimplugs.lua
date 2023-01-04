local setup_packer = require('packer').startup(function(use)
--config = {
--    package_root = vim.fn.stdpath('config') .. '/site/pack'
--    }
use 'wbthomason/packer.nvim'

--[[ 
    VISUALS
--]]
use 'NLKNguyen/papercolor-theme'
-- Using the nerdtree variant broke it so include and compile to fix it.
--use 'kyazdani42/nvim-web-devicons'
use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

--[[ 
    COMPLETION
--]]
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

--[[ 
    LANGUAGE SERVERS
--]]
use 'Olical/conjure'
use 'ionide/Ionide-vim'


use 'ziglang/zig.vim'

-- Setup env variables for jenkins api, see .userconf.sh
use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })


--[[
    UTILS
--]]
use 'jeffkreeftmeijer/vim-numbertoggle'
use 'nvim-lua/plenary.nvim'
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
end)

require'plugsconf'
return setup_packer
