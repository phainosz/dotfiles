return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = "nvim-treesitter/nvim-treesitter-context",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      rensure_installed = {
        "java", "javascript", "go", "lua", "html", "json", "markdown", "markdown_inline", "yaml"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}
