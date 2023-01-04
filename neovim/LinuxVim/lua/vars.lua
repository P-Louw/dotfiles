local g = vim.g
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

g.t_co = 256
g.background = "dark"

g.netrw_banner = 1
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 20

