-- Set default packpath.
-- local packer_path = vim.fn.stdpath('config') .. '/site'
-- vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- Set after plugin on package path for requires from after folder.
--local home_dir = os.getenv('HOME')
--package.path = home_dir .. '/.config/nvim/after/plugin/?.lua;' .. package.path

local install_path = vim.fn.stdpath('config')..'/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!$(which git) clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

-- Automatically run :PackerCompile whenever this file is updated
vim.api.nvim_create_autocmd('BufWritePost', { command = 'PackerCompile' })

-- load packer
vim.cmd('packadd packer.nvim')
local setup_packer = require('packer').startup(function(use)
--config = {
--    package_root = vim.fn.stdpath('config') .. '/site/pack'
--    }
use 'wbthomason/packer.nvim'
--[[ 
    VISUALS
--]]
use 'NLKNguyen/papercolor-theme'
use 'Yggdroot/indentLine'
-- Using the nerdtree variant broke it so include and compile to fix it.
use 'kyazdani42/nvim-web-devicons'
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
--[[
    UTILS
--]]
-- Setup env variables for jenkins api, see .userconf.sh
use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
use 'jeffkreeftmeijer/vim-numbertoggle'
use 'nvim-lua/plenary.nvim'
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
end)

return setup_packer
