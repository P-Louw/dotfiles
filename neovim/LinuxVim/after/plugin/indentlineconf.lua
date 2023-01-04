local g = vim.g

g.indentLine_setColors = 0
-- Vim
g.indentLine_color_term = 239

-- GVim
g.indentLine_color_gui = '#A4E57E'

-- none X terminal
g.indentLine_color_tty_light = 7 -- (default: 4)
g.indentLine_color_dark = 1 -- (default: 2)

-- Background (Vim, GVim)
g.indentLine_bgcolor_term = 202
g.indentLine_bgcolor_gui = '#FF5F00'
g.indentLine_char_list = {'|', '¦', '┆', '┊'}

function FileTypeSetup()
  if (vim.bo.filetype == 'md') then
      g.vim_json_conceal = 0
  elseif(vim.bo.filetype == 'md') then
    g.markdown_syntax_conceal = 0
  end
end

vim.api.nvim_create_autocmd({'BufEnter', 'BufNewFile' }, { callback = FileTypeSetup })


