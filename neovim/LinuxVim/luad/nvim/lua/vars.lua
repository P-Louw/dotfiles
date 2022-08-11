local g = vim.g

g.t_co = 256
g.background = "dark"
g.python3_host_prog = '/usr/bin/python3.10'
g.python_host_prog =''

g.netrw_banner = 1
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 20

-- Set packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- Plug options
vim.g['deoplete#enable_at_startup'] = 1

vim.g['fsautocomplete#fsautocomplete_command'] = {  'fsautocomplete', '--background-service-enabled' }
