## Windows config neovim with LSP


# Install requirements:

*Editor functionality*
- Neovim 8+ lsp lua enabled
- Python 3.10+ and python 2.7 from C:\ in path or referenced in init.vim
    - pip neovim module required for these.
- neovim/nvim-lspconfig
- roxma/vim-hug-neovim-rpc
- roxma/nvim-yarp
- Shougo/deoplete.nvim
- deoplete-plugins/deoplete-lsp
- tpope/vim-fugitive
- itchyny/lightline.vim
- jeffkreeftmeijer/vim-numbertoggle
- NLKNguyen/papercolor-theme


*Languange support*
- fsautocomplete
- ionide-vim
- ziglang/zig.vim
- zls

# Scripting steps install

Use assume modern w10 and use winget.

- Check and update winget
- Disable python execution aliases
- Install winget packages
  - winget install BurntSushi.ripgrep.GNU
  - LuaJit
  - (interactive) winget install -e -i --id=Python.Python.2 --source=winget --scope=machine
  - (interactive) winget install -e -i --id=Python.Python.3.11 --source=winget --scope=machine
  - python.exe -m pip install pynvim
  - node version manager (nvm)
  - npm install -g neovim
  - winget install  RubyInstallerTeam.RubyWithDevKit.3.2 --scope=machine
  - gem install neovim
  - Install lua language server machine level via winget or dl from gh and place in `$PATH`.
