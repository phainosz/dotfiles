local keymap = vim.keymap.set

-- VSCODE REMAP INSIDE NVIM

-- general keymaps
keymap({ "n" }, "<leader>q", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n" }, "<leader>e", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
keymap({ "n" }, "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")
keymap({ "n" }, "gd", "<cmd>lua require('vscode').action('editor.action.goToDeclaration')<CR>")
keymap({ "n" }, "gi", "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>")
keymap({ "n" }, "ge", "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>")
keymap({ "n", "v" }, "<leader>qf", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>vp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>sc", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- commands not working properly or lagged
--keymap({ "n" }, "<C-h>", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
--keymap({ "n" }, "<C-l>", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")

-- bookmarks keymaps
keymap({ "n" }, "<leader>a", "<cmd>lua require('vscode').action('bookmarks.toogle')<CR>")
keymap({ "n" }, "<leader>u", "<cmd>lua require('vscode').action('bookmarks.list')<CR>")
