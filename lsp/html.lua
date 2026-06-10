return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'xhtml' },
  settings = {
    html = {
      format = { enable = true },
      validate = {
        scripts = true,
        styles = true,
      },
      customData = {},
    }
  },

  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true }
  },
  on_attach = function()
    vim.diagnostic.config({
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    })
  end,
}
