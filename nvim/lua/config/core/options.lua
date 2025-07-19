vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

-- tab / identantion
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

-- behavior setting
vim.opt.encoding = "UTF-8"              -- Set encoding
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
