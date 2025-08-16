-- General mappings
local cmp = require 'cmp'
local select_opts = {behavior = cmp.SelectBehavior.Select}

-- Set in main init for other plugins:
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local M = {}

M.cmp_mapping = {
  ['<C-b>'] = cmp.mapping.scroll_docs( -4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
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
  end, { 'i', 's' }),
  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}

M.keymap_telescope = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>er', builtin.diagnostics, {})
end

M.on_attach_lsp = function()
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
M.custom_ionide = function()
  -- You can enable debug-mode in order to inspect the fsautocomplete behavior by setting the global vim variable g:fsharpbinding_debug to a non-zero value:
  -- let g:fsharpbinding_debug = 1
  -- This will create two log files log.txt and log2.txt in your temporary folder (i.e. /tmp/).
  -- Override the default F# interactive binary
  -- let g:fsharp_interactive_bin = '/path/to/fsi'
  -- You can set the msbuild/xbuild path.
  -- let g:fsharp_xbuild_path = "/path/to/xbuild/or/msbuild"
  -- This setting needs to point to a suitable test runner (such as nunit-console.exe)
  -- let g:fsharp_test_runner = "/path/to/test/runner"
  -- This enables the helptext to be displayed during auto completion. Turn off if completion is too slow.
  -- let g:fsharp_completion_helptext = 1
  -- Show comments, in addition to type signature, when using Omni completion (default=0).
  -- let g:fsharp_helptext_comments = 1
  -- If you find the default bindings unsuitable then it is possible to turn them off.
  -- let g:fsharp_map_keys = 0
  -- It is also possible to configure them to provide a more customised experience.

  -- Override the default prefix of <leader> to the keys cp
  vim.g["g:fsharp_map_prefix "] = ','

  -- Override the default mapping to send the current like to fsharp interactive
  -- let g:fsharp_map_fsisendline = 'p'

  -- Override the default mapping to send the current selection to fsharp interactive
  -- let g:fsharp_map_fsisendsel = 'p'
  -- Override the default mapping to go to declaration in the current window
  -- let g:fsharp_map_gotodecl = 'g'
  -- Override the default mapping to go back to where go to declaration was triggered
  -- let g:fsharp_map_gobackfromdecl = 'b'
  -- Override the default mapping to evaluate an fsharp expression in the fsi
  -- let g:fsharp_map_fsiinput = 'i'
  -- Automatically open the result of an FsiEval (fsi-out buffer) in a vsplit window
  -- let g:fsharp_fsi_show_auto_open = 1
end

return M
