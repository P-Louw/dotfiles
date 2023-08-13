
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { 'clojure_lsp', 'zls', 'groovyls', 'pyright', 'tsserver' }

-- General setup:
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
  }
end

local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup {
  capabilities = html_capabilities,
  filetypes = { 'html', 'liquid', 'hbs', 'handlebars', 'mustache'}
}

-- Specific setup:
lspconfig.groovyls.setup{
    on_attach = require('mappings').on_attach_lsp,
    capabilities = capabilities,
    enable_snippets = true,
    -- Unix
    cmd = { "java", "-jar", "/opt/groovy-language-server.jar" },
}

lspconfig.pyright.setup{
    on_attach = require('mappings').on_attach_lsp,
    capabilities = capabilities,
    enable_snippets = true,
    settings = {
      python = {
        analysis = {
          indexing = true,
          typeCheckingMode = 'basic'
        }
      }
    }
}

lspconfig.lua_ls.setup{
    on_attach = require('mappings').on_attach_lsp,
    capabilities = capabilities,
    enable_snippets = true,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
          telemetry = { enable = false },
        }
      }
    }
}

-- Diagnostics lsp
local signs = {
    Error = '❌',
    Warn = '⚠️ ',
    Info = 'ℹ️ ',
    Hint = '💡' }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.g['fsautocomplete#fsautocomplete_command'] = {  'fsautocomplete', '--background-service-enabled' }
