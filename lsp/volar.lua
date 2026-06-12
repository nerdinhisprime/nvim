return {
  filetypes = { 'vue' },
  init_options = {
    vue = {
      hybridMode = true,
    },
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
