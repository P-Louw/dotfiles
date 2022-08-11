return require('packer').startup(function(use)
config = {
    package_root = vim.fn.stdpath('config') .. '/site/pack'
    }
use 'wbthomason/packer.nvim'
use 'NLKNguyen/papercolor-theme'

if vim.call('has', 'nvim') then
	use {
        'Shougo/deoplete.nvim',
        run = ':UpdateRemotePlugins'
    }
else
	use 'Shougo/deoplete.nvim'
	use 'roxma/nvim-yarp'
	use 'roxma/vim-hug-neovim-rpc'
end

use 'neovim/nvim-lspconfig'

use 'deoplete-plugins/deoplete-lsp'

-- use {
--     'junegunn/fzf', 
--     run = ':fzf#install'
-- }
-- 
-- use 'junegunn/fzf.vim'
use 'nvim-lua/plenary.nvim'

use 'ionide/Ionide-vim'
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
-- Disables relative numbers when in insertmode:
use 'jeffkreeftmeijer/vim-numbertoggle'

use 'ziglang/zig.vim'
require'lspconfig'.zls.setup{}
require'lspconfig'.pyright.setup{}
use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
require('plugsconf.telescope_opts')
require('plugsconf.lspconf')
--require('plugsconf.lualineconf')
require('plugsconf.lualineconf_bubbles')
--require('plugsconf.lualineconf_slanted')
--require('plugsconf.lualineconf_evil')
end)
