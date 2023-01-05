
local M = {}

local opts = { noremap=true, silent=true }
vim.g.mapleader = ','
vim.g.localleader = '\\'

--[[ Map non attach keys for plugins --]]
M.setup = function()
  -- Alternative way of mapping:
  --local map = vim.api.nvim_set_keymap
  --map('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap=true })
--[[
    Telescope
--]]
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end

local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}

M.cmp_mappings = {
  -- Cancel completion.
  ['<C-e>'] = cmp.mapping.abort(),
  -- Autocomplete with tab.
  ['<Tab>'] = cmp.mapping(function(fallback)
    -- Confirm completion.
  local col = vim.fn.col('.') - 1
  if cmp.visible() then
    cmp.select_next_item(select_opts)
  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    fallback()
  else
    cmp.complete()
  end
end, {'i', 's'}),
['<CR>'] = cmp.mapping.confirm({select = false}),
-- Scroll in doc window.
['<C-u>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach_lsp = function(client, bufnr)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

return M
