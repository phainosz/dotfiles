return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" })
    vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      { desc = "Go to next harpoon mark" })
    vim.keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" })
    vim.keymap.set("n", "<leader>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Toggle quick menu" })
  end,
}
