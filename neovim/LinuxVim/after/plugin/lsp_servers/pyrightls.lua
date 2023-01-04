
local g = vim.g
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function call_shell(command)
  local trim = function(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
  end
  local handle = io.popen(command)
  if handle ~= nil then
    local result = handle:read("*a")
    handle:close()
    return trim(result)
  end
end

-- find the python3 binary for neovim
local which_python
if vim.env.VIRTUAL_ENV and vim.env.ASDF_DIR then
  which_python = "which -a python3 | head -n3 | tail -n1"
elseif vim.env.VIRTUAL_ENV then
  which_python = "which -a python3 | tail -n2 | head -n1"
elseif vim.env.ASDF_DIR then
  which_python = "which -a python3 | head -n1"
else
  which_python = "which python3"
end
g.python3_host_prog = call_shell(which_python)

require'lspconfig'.pyright.setup{
    on_attach = require('mappings').on_attach_lsp,
    enable_snippets = true,
    capabilities = capabilities,
}

