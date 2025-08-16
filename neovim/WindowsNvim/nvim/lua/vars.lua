local g = vim.g
local opt = vim.opt
-- These are set in the mappings file:
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"

g.python3_host_prog = 'C:\\Program Files\\Python311\\python.exe'
g.python2_host_prog = 'C:\\Python27\\python.exe' 
g.ruby_host_prog = 'C:\\Ruby32-x64\\bin\\ruby.exe'

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
