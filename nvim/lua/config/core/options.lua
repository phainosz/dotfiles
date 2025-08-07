-- theme & transparency
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- UI behavior
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
vim.opt.cursorline = true  -- Highlight the current line
vim.opt.signcolumn = "yes" -- Always show sign column to avoid text shifting

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Case insensitive by default
vim.opt.smartcase = true  -- But case-sensitive if capital letters are used

-- Colors
vim.opt.termguicolors = true

-- Behavior
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.encoding = "UTF-8"
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

vim.opt.winborder = "rounded"

-- File handling
vim.opt.updatetime = 200 -- Increase slightly to avoid too many events
vim.opt.autoread = true  -- Auto reload files changed outside vim
