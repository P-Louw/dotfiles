local g = vim.g
local opt = vim.opt

g.python3_host_prog = '/usr/bin/python'
g.python_host_prog = ""

g.t_co = 256
g.background = "dark"

g.netrw_banner = 1
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 1
g.netrw_winsize = 20

--[[
        OPTIONS
--]]
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
--opt.foldmethod = 'expr'
--opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Filetype detection for Ansible
-- Note: Helm filetype detection is handled by helm-ls.nvim plugin
vim.filetype.add({
  pattern = {
    -- Detect Ansible files by common patterns
    [".*playbooks/.*%.yml"] = "yaml.ansible",
    [".*playbooks/.*%.yaml"] = "yaml.ansible",
    [".*roles/.*/tasks/.*%.yml"] = "yaml.ansible",
    [".*roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
    [".*roles/.*/handlers/.*%.yml"] = "yaml.ansible",
    [".*roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
    [".*group_vars/.*%.yml"] = "yaml.ansible",
    [".*group_vars/.*%.yaml"] = "yaml.ansible",
    [".*host_vars/.*%.yml"] = "yaml.ansible",
    [".*host_vars/.*%.yaml"] = "yaml.ansible",
    [".*ansible/.*%.yml"] = "yaml.ansible",
    [".*ansible/.*%.yaml"] = "yaml.ansible",
  },
})
