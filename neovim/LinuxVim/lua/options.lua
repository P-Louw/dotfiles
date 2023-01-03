local o = vim.o

o.clipboard = 'unnamed'
o.visualbell = true
o.mouse = 'a'

o.showtabline = 2
o.scrolloff = 5
o.cmdheight = 2
o.laststatus = 2


-- [[ File settings ]]
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.fileformat = 'unix'
o.backup = false
o.swapfile = false
o.undofile = false

-- [[ Drawing/syntax ]]
o.wildmenu = true
o.lazyredraw = false
o.syntax = "ON"
o.termguicolors = true
vim.api.nvim_command('colorscheme PaperColor')

o.number = true
o.relativenumber = true

-- [[ Search ]]
-- showmode eats input and bugs.
--o.showmode = false
o.showmatch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.backspace = "indent,eol,start"
o.autoindent = true
o.linebreak = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

o.foldenable = true
o.foldmethod = 'marker'
o.foldlevelstart = 20
o.foldnestmax = 10
