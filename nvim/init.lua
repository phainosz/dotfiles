if vim.g.vscode then
  -- VSCode extension
  require("config.core.options")
  require("config.core.remap")
  require("config.core.vscode-remap")
else
  -- ordinary Neovim
  require("config")
end
