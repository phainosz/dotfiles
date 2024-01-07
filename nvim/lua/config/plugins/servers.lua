return {
  "efm",
  "bashls",
  "lua_ls",
  "emmet_ls",
  "jsonls",
  "gopls",
  "jdtls"
}
--change in future to:
--lua_ls = {
--    Lua = {
--      workspace = { checkThirdParty = false },
--      telemetry = { enable = false },
--      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--      -- diagnostics = { disable = { 'missing-fields' } },
--    },
--  },
--  and use it as vim.tbl_keys(server)
--  see more at nvim kickstart
