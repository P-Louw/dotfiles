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

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

use 'ziglang/zig.vim'
-- Requires zls installed and in path.
require'lspconfig'.zls.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_inlay_hints = true,
    enable_snippets = true,
    capabilities = capabilities,
}
require'lspconfig'.pyright.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
    capabilities = capabilities,
}
require'lspconfig'.sumneko_lua.setup{
  on_attach = require('mappings').on_attach_lsp,
  enable_snippets = true,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
}

-- Setup env variables for jenkins api, see .userconf.sh
use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
-- Requires groovy server see:
require'lspconfig'.groovyls.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
    capabilities = capabilities,
    -- Unix
    cmd = { "java", "-jar", "/opt/groovy-language-server.jar" },
}


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
