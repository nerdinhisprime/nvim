return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  root_markers = {
    "vue.config.js",
    "vue.config.ts",
    "nuxt.config.js",
    "nuxt.config.ts",
  },
  settings = {
    vue = {
      features = {
        updateDocsFromDiagnostic = true,
      },
      validation = {
        template = true,
        style = true,
        script = false,
      },
    },
  },
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
