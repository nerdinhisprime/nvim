require("opts")
require("kmaps")
require("autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup("plugins")



local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("Плагин nvim-lspconfig не найден!", vim.log.levels.ERROR)
  return
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Включение нативных фич Neovim 0.11+ для активного LSP",
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false, id = client.id })
      end,
    })
  end,
})

lspconfig.lua_ls.setup(require("lsp.lua-ls"))
lspconfig.vtsls.setup(require('lsp.vtsls-ls'))
lspconfig.volar.setup(require('lsp.volar-ls'))

local simple_servers = {
  "html",
  "cssls",
  "jsonls",
  "emmet_ls",
}

for _, server in ipairs(simple_servers) do
  lspconfig[server].setup({})
end
