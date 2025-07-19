return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  event = "BufReadPre",
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        keymaps = {
          ---@since 1.0.0
          -- Keymap to expand a package
          toggle_package_expand = "<CR>",
          ---@since 1.0.0
          -- Keymap to install the package under the current cursor position
          install_package = "i",
          ---@since 1.0.0
          -- Keymap to reinstall/update the package under the current cursor position
          update_package = "u",
          ---@since 1.0.0
          -- Keymap to check for new version for the package under the current cursor position
          check_package_version = "c",
          ---@since 1.0.0
          -- Keymap to update all installed packages
          update_all_packages = "U",
          ---@since 1.0.0
          -- Keymap to check which installed packages are outdated
          check_outdated_packages = "C",
          ---@since 1.0.0
          -- Keymap to uninstall a package
          uninstall_package = "X",
          ---@since 1.0.0
          -- Keymap to cancel a package installation
          cancel_installation = "<C-c>",
          ---@since 1.0.0
          -- Keymap to apply language filter
          apply_language_filter = "<C-f>",
          ---@since 1.1.0
          -- Keymap to toggle viewing package installation log
          toggle_package_install_log = "<CR>",
          ---@since 1.8.0
          -- Keymap to toggle the help view
          toggle_help = "g?",
        },
      },
    })

    local servers = {
      "gopls",
      "lua_ls",
      "efm",
      "jdtls"
    }
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = servers,    -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "isort",    -- python formatter
        "black",    -- python formatter
        "pylint",   -- python linter
        "eslint_d", -- js linter
        "gopls",    -- go formatter
        "lua_ls",   -- lua language server
      },
    })
  end,
}
