return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = false
    }
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "javascript", "go", "lua", "html"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}
