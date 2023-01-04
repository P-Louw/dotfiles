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

o.number = true
o.relativenumber = true
-- Won't render somehow.
vim.opt.listchars='tab:>-,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»,conceal:┊'

-- [[ Search ]]
-- showmode eats input and bugs.
--o.showmode = false
o.wildignore = vim.o.wildignore..table.concat({
  '*.o','*.obj','.git','*.rbc','*.pyc','__pycache__','*~','*.class',
  '*.git/*','*.hg/*','*.svn/*',
  '*/node_modules/*','*/.dist/*','*/.coverage/*'
})
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
