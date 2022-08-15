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

-- Setup env variables for jenkins api, see .userconf.sh
use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })

use 'neovim/nvim-lspconfig'

use 'deoplete-plugins/deoplete-lsp'

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
-- Requires zls installed andin path.
require'lspconfig'.zls.setup{}
require'lspconfig'.pyright.setup{}
-- Requires groovy server see:
-- :h lspconfig-all
require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "/opt/groovy-language-server.jar" },
}
use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

--[[
    LOAD CONFIG FILES
]]--
require('plugsconf.telescope_opts')
require('plugsconf.lspconf')

--require('plugsconf.lualineconf')
require('plugsconf.lualineconf_bubbles')
--require('plugsconf.lualineconf_slanted')
--require('plugsconf.lualineconf_evil')

end)
