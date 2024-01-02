vim.keymap.set("n", "<leader><leader>", vim.cmd.Ex)

-- paste without loosing buffer
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- exit insert mode with Ctrl + c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- apply zz with known commands to stay in middle screen when using them
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- paste without copy selected value that is changed
vim.keymap.set({"n", "v"}, "<leader>p", "\"_dP")

-- delete without copy selected value that is changed
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", function()
    vim.cmd("wa")
end)
