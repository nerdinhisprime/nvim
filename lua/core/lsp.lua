vim.lsp.enable({
  'lua_ls',
  'vtsls',
  'volar',
  'cssls',
  'jsonls',
  'emmet-ls',
})

local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
  capabilities = blink_capabilities
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
