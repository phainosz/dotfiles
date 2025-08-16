-- =====================
-- PLUGINS (vim.pack.add)
-- =====================
vim.pack.add({
  { src = "git@github.com:williamboman/mason.nvim.git" },
  { src = "git@github.com:williamboman/mason-lspconfig.nvim.git" },
  { src = "git@github.com:WhoIsSethDaniel/mason-tool-installer.nvim.git" },
  { src = "git@github.com:neovim/nvim-lspconfig.git" },
  { src = "git@github.com:hrsh7th/nvim-cmp.git" },
  { src = "git@github.com:hrsh7th/cmp-nvim-lsp.git" },
  { src = "git@github.com:hrsh7th/cmp-buffer.git" },
  { src = "git@github.com:hrsh7th/cmp-path.git" },
  { src = "git@github.com:L3MON4D3/LuaSnip.git" },
  { src = "git@github.com:saadparwaiz1/cmp_luasnip.git" },
  { src = "git@github.com:onsails/lspkind.nvim.git" },
  { src = "git@github.com:lewis6991/gitsigns.nvim.git" },
  { src = "git@github.com:nvim-lualine/lualine.nvim.git" },
  { src = "git@github.com:nvim-treesitter/nvim-treesitter.git" },
})

-- =====================
-- THEME & TRANSPARENCY
-- =====================
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
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colors
vim.opt.termguicolors = true

-- Behavior
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"
vim.opt.winborder = "rounded"
vim.opt.clipboard:append("unnamedplus")

-- File handling
vim.opt.updatetime = 200
vim.opt.autoread = true

-- File Explorer
vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "Open file explorer (netrw)" })

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down & center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up & center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search & center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search & center" })

-- Clipboard integration
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Paste without overwriting default register
vim.keymap.set({ "n", "v" }, "<leader>p", "\"_dP", { desc = "Paste without replacing clipboard" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete without yanking" })

-- Save all files
vim.keymap.set("n", "<C-s>", "<cmd>wa<CR>", { desc = "Save all files" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- =====================
-- CMP & SNIPPETS
-- =====================
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("javascript", { "jsdoc" })
luasnip.filetype_extend("java", { "javadoc" })

cmp.setup({
  completion = { completeopt = "menu,menuone,preview,noselect" },
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
  formatting = { format = require("lspkind").cmp_format({ maxwidth = 50, ellipsis_char = "..." }) },
})

-- =====================
-- LSP
-- =====================
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
  opts.buffer = bufnr

  opts.desc = "Show LSP references"
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- show definition, references

  opts.desc = "Go to declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

  opts.desc = "Show LSP implementations"
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show line diagnostics"
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
  end)
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
  end)

  opts.desc = "Show documentation for what is under cursor"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

end

local lspconfig = require("lspconfig")
lspconfig.cssls.setup({ 
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.gopls.setup({ 
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.html.setup({ 
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

-- =====================
-- GITSIGNS
-- =====================
require("gitsigns").setup({
  signs = { add = { text = '+' }, change = { text = '~' }, delete = { text = '_' }, topdelete = { text = '‾' }, changedelete = { text = '~' } },
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    map("n", "]c",
    function() if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else require("gitsigns").nav_hunk("next") end end)
    map("n", "[c",
    function() if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else require("gitsigns").nav_hunk("prev") end end)
  end,
})

-- =====================
-- LUALINE
-- =====================
require("lualine").setup({ options = { theme = "auto", icons_enabled = false } })

-- =====================
-- MASON
-- =====================
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
      toggle_package_install_log = "<CR>",
      toggle_help = "g?",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {  },
  automatic_installation = true,
})

require("mason-tool-installer").setup({
  ensure_installed = { "stylua", "gopls", "lua_ls" },
})

-- =====================
-- TREESITTER
-- =====================
require('nvim-treesitter.configs').setup({
  ensure_installed = {},
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
