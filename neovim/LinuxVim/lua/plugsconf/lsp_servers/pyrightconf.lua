
local g = vim.g
local capabilities = require('cmp_nvim_lsp').default_capabilities()

g.python3_host_prog = '/usr/bin/python'
g.python_host_prog =''

require'lspconfig'.pyright.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
    capabilities = capabilities,
}

