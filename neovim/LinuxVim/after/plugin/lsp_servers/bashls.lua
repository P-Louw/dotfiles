local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.bashls.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_inlay_hints = true,
    enable_snippets = true,
    capabilities = capabilities,
}
