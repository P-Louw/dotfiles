
local map = vim.api.nvim_set_keymap

map('n', 'ff', ':Telescope find_files<CR>', { noremap=true })
map('n', 'fg', ':Telescope live_grep<CR>', { noremap=true })
map('n', 'fb', ':Telescope buffers<CR>', { noremap=true })
map('n', 'fh', ':Telescope help_tags<CR>', { noremap=true })

