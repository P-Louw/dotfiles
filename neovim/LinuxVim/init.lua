
-- LEADER

-- IMPORT
require('vars')
require('options')
require('plugins')
require('mappings').setup()

vim.api.nvim_command('colorscheme PaperColor')

--[[ 
function generate_uuid()
    math.randomseed(os.time())
    local random = math.random
    local template = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    return string.gsub(template, "x", function()
      local v = random(0, 0xf)  -- v is a decimal number 0 to 15
      return string.format("%x", v) --formatted as a hex number
    end)

local insert_uuid = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local uuid = generate_uuid()
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })
end

vim.keymap.set('i', '\\', insert_uuid, { noremap = true, silent = true })
--]]

