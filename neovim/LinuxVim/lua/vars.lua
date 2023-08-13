local g = vim.g
local opt = vim.opt
-- These are set in the mappings file:
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"

g.python3_host_prog = '/usr/bin/python'
g.python_host_prog = ""

g.t_co = 256
g.background = "dark"

g.netrw_banner = 1
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 20

-- Opts

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
