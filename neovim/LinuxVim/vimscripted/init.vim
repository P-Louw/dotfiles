
"{{{ Utility options

"System clipboard enable:
set clipboard=unnamed

set visualbell

"Various cursor configs:
"set nocompatible
set mouse=a
"set cursor shapes:

"}}}

"{{{ View/visual preferences

"Cursor shape settings:
" 1 -> Blinking block.
" 2 -> Solid block.
" 3 -> Blinking underscore.
" 4 -> Solid underscore.
" 5 -> Blinking vertical bar.
" 6 -> Solid vertical bar.
" Insert
let &t_SI= "\e[5 q"
" Normal
let &t_EI= "\e[2 q"
" Replace
let &t_EI= "\e[4 q"
"Enable 256 colors:
set termguicolors
"set t_Co=256
"or enable true colors:
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Show tab line at all times
set showtabline=2
"Amount of lines to keep above and below a line select
set scrolloff=5

set cmdheight=2

set laststatus=2

"disable insert msg when using lightline
set noshowmode

"}}}

"{{{ Folder/location navigation

"change built in function path and append it to value, used for searching
"files ** means recursively search through files
set path+=**

"{{{2 Builtin explorer settings:


"Built in folder explorer:
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

"}}}2

"}}}

"{{{ Symbols:

"Show tab completes as visual menu:
set wildmenu

"Disable redraw on tab completes etc:
set lazyredraw

"enable syntax higlighting:
syntax on

"Enable Ctags
command! MakeTags !ctags -R .

"{{{2 Search symbols settings:

"Show matches on parenthesis on matching selections:
set showmatch
"search as characters are typed out:
set incsearch
"Highlight matching searches, can be turn off in editor with :nohlsearch :
set hlsearch
"Macro for toggle off highlight after search bound to ctrl l
nnoremap <C-L> :nohlsearch<CR><C-L>

set ignorecase
set smartcase

"}}}2

"}}}

"{{{ File settings:
"

set nobackup
"disable temp swapfile when editing
set noswapfile
set noundofile

"Allow backspace over mentioned
set backspace=indent,eol,start
"autocmd FileType cs setlocal tabstop=4
"Set pressign tab to 4 spaces:
"set tabstop=4
"set softtabstop=4
"setting tabstop, default equals this. Can be enabled for defensive purpose.
"set softtabstop=0 noexpandtab
"Indent corresponde to N whitespace:
"set shiftwidth=4
"For indents to corresponding to ?? :
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
"set autoindent
"set tabstop=4
"set shiftwidth=4
"filetype indent on
set autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

"Disables linebreak in a the midde of a word:
set linebreak

"Specify encoding, neovim qt seems to complain about utf-8 even with this
"enabled:
set encoding=utf-8
"set formats for platform
"set fileformats=unix,dos,mac
set fileformat=unix


"{{{2 Fold settings:

"Save code folds:
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"Enable folding
set foldenable
"Set markers for folding
set foldmethod=marker
"auto folds only very nested:
set foldlevelstart=0
set foldlevel=20
"set a max for fold levels:
set foldnestmax=10

"}}}2


"
"}}}

"{{{ Plugin settings:

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'EdenEast/nightfox.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'ionide/Ionide-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-lsp'

Plug 'ziglang/zig.vim'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Disables relative numbers when in insertmode:
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Lightweight powerline variant no dependency:
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'neomake/neomake'

call plug#end()
lua << EOF
    local nvim_lsp = require('lspconfig')

    vim.lsp.set_log_level 'debug'

    local servers = {'zls'}
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

"Enable completions as you type
let g:completion_enable_auto_popup = 1
let g:deoplete#enable_at_startup = 1
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"let g:python2_host_prog = expand('/usr/bin/')
let g:python3_host_prog = expand('/usr/bin/python')

"line numbers enabled with relative numbers(vim-numbertoggle, see 'Plug
"section'):
set number relativenumber

filetype plugin indent on

"Set coloring scheme
"colorscheme nightfox
"colorscheme duskfox
colorscheme PaperColor
"source $HOME/.config/nvim/colors/tconf.nightfly.vim

let g:lightline = {
      \ 'colorscheme': 'duskfox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '▒║', 'right': ' ▒╠' },
      \ 'subseparator': { 'left': '⮁', 'right': '📝' }
      \ }
" ⮃
" 📝
" ⬛
" ⚫
" Set encoding at end for testing, to be sure:
set encoding=utf-8

