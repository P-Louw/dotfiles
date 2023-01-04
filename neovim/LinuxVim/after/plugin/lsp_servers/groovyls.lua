
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Requires groovy server see:
require'lspconfig'.groovyls.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
    capabilities = capabilities,
    -- Unix
    cmd = { "java", "-jar", "/opt/groovy-language-server.jar" },
}
