return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, --move to prev result
            ["<C-j>"] = actions.move_selection_next,     --move to next result
            ["<C-q>"] = actions.send_selected_to_qflist, --actions.open_qflist,
          },
        },
      },
    })

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files in" })
    vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Find string in cwd" })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find in git files" })
    vim.keymap.set('n', '<leader>ft', builtin.help_tags, { desc = "Show help tags" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find old files" })
  end
}
