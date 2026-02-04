-- Core keybindings for window management, navigation, buffers, tabs, and UI toggles
local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Window splits
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })

-- Buffer navigation (Shift+h/l already defined in bufferline, but add <leader>bb)
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Tab management
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Terminal keybindings (using Snacks if available)
map("n", "<leader>ft", function()
  require("snacks").terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function()
  require("snacks").terminal()
end, { desc = "Terminal (cwd)" })

-- Toggle terminal with Ctrl+/
map({ "n", "t" }, "<c-/>", function()
  require("snacks").terminal()
end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<c-_>", function()
  require("snacks").terminal()
end, { desc = "Toggle Terminal (which-key)" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- Better paste in visual mode (don't yank replaced text)
map("v", "p", '"_dP', { desc = "Paste Without Yank" })

-- Quick save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- UI Toggles (<leader>u)
map("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
  vim.notify("Spell: " .. (vim.opt.spell:get() and "on" or "off"))
end, { desc = "Toggle Spelling" })

map("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.notify("Wrap: " .. (vim.opt.wrap:get() and "on" or "off"))
end, { desc = "Toggle Line Wrap" })

map("n", "<leader>ul", function()
  vim.opt.number = not vim.opt.number:get()
  vim.notify("Line Numbers: " .. (vim.opt.number:get() and "on" or "off"))
end, { desc = "Toggle Line Numbers" })

map("n", "<leader>uL", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  vim.notify("Relative Numbers: " .. (vim.opt.relativenumber:get() and "on" or "off"))
end, { desc = "Toggle Relative Line Numbers" })

map("n", "<leader>ud", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    vim.notify("Diagnostics: off")
  else
    vim.diagnostic.enable()
    vim.notify("Diagnostics: on")
  end
end, { desc = "Toggle Diagnostics" })

map("n", "<leader>uf", function()
  if vim.g.disable_autoformat then
    vim.g.disable_autoformat = false
    vim.b.disable_autoformat = false
    vim.notify("Autoformat: on")
  else
    vim.g.disable_autoformat = true
    vim.notify("Autoformat: off")
  end
end, { desc = "Toggle Auto Format (Global)" })

map("n", "<leader>uF", function()
  if vim.b.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.notify("Autoformat (buffer): on")
  else
    vim.b.disable_autoformat = true
    vim.notify("Autoformat (buffer): off")
  end
end, { desc = "Toggle Auto Format (Buffer)" })

-- Quit commands
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
