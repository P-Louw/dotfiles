
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { 'clojure_lsp', 'zls', 'groovyls', 'pyright','lua_ls' , 'tsserver' }

-- General setup:
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
  }
end

-- lspconfig.clojure_lsp.setup{
--   filetypes = { "clj", "bb", "edn" }
-- }

lspconfig.powershell_es.setup{
  bundle_path = 'C:\\Users\\pldbr\\Documents\\PowerShellEditorServices',
  shell = 'powershell.exe',
}

-- Specific setup:
lspconfig.groovyls.setup{
    on_attach = require('mappings').on_attach_lsp,
    capabilities = capabilities,
    enable_snippets = true,
    -- Unix
    cmd = { "java", "-jar", "/opt/groovy-language-server.jar" },
}

--vim.g['fsautocomplete#fsautocomplete_command'] = {  'fsautocomplete', '--background-service-enabled' }
