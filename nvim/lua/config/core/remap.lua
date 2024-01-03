vim.keymap.set("n", "<leader>q", vim.cmd.Ex, { desc = "Go to netrw" })

-- exit insert mode with Ctrl + c
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit mode" })

-- move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- apply zz with known commands to stay in middle screen when using them
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- paste without copy selected value that is changed
vim.keymap.set({ "n", "v" }, "<leader>p", "\"_dP", { desc = "Paste without loosing buffer" })

-- delete without copy selected value that is changed
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete withou loosing buffer" })

vim.keymap.set("n", "<C-s>", function()
  vim.cmd("wa")
end, { desc = "Save all" })
