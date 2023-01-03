
-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"
vim.keymap.set("n", "<Leader><Leader>", function() print("Hello leader!") end)
vim.keymap.set("n", "<localleader><localleader>", function() print("Hello localleader!") end)

-- IMPORT
require('vars')
require('options')
require('vimplugs')
require('mappings').setup()

