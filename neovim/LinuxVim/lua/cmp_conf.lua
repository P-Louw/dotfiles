local cmp = require 'cmp'
local mapping = require 'mappings'.cmp_mapping
require('cmp_path')


local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local function shorten_with_ellipsis(min_width, max_width, str)
  local ellipsis = '...'
  local trunc_str = vim.fn.strcharpart(str, 0, max_width)
  if trunc_str ~= str then
    return trunc_str .. ellipsis
  elseif string.len(str) < min_width then
    local padding = string.rep(' ', min_width - string.len(str))
    return str .. padding
  end
  return str
end

local MIN_LABEL_WIDTH = 20
local MAX_LABEL_WIDTH = 20

cmp.setup({
  window = {
    --completion = cmp.config.window.bordered(),
    --documentation = cmp.config.window.bordered(),
    -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --    col_offset = -3,
    --    side_padding = 0,
  },
  formatting = {
    format = function(_, vim_item)
      local icon = kind_icons[vim_item.kind]
      vim_item.abbr = (icon .. shorten_with_ellipsis(MIN_LABEL_WIDTH, 15, vim_item.abbr))
      vim_item.kind = ""
      vim_item.menu = shorten_with_ellipsis(MIN_LABEL_WIDTH, 30, vim_item.menu)
      return vim_item
    end
    --    -- Source
    --    -- vim_item.menu = ({
    --    --   buffer = "[Buffer]",
    --    --   nvim_lsp = "[LSP]",
    --    --   luasnip = "[LuaSnip]",
    --    --   nvim_lua = "[Lua]",
    --    --   latex_symbols = "[LaTeX]",
    --    -- })[entry.source.name]
    --    return vim_item
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert(mapping),
  sources = cmp.config.sources({
    { name = 'conjure' },
    { name = 'nvim_lsp' },
    -- { name = 'path' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  },
    {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
