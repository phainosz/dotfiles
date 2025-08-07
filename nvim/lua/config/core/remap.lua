-- File Explorer
vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "Open file explorer (netrw)" })

-- Exit insert mode with Ctrl + c
--vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit mode" })

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
