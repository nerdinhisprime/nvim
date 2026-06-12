local vue_plugin_path = "/usr/lib/node_modules/@vue/language-server"
local is_vue_plugin_installed = vim.fn.isdirectory(vue_plugin_path) == 1

return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascript.jsx", "typescript", "typescript.tsx", "vue" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },

  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
      tsserver = is_vue_plugin_installed and {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_plugin_path,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      } or nil,
    },
    typescript = {
      pluginIds = { "@vue/typescript-plugin" },
      updateImportsOnFileMove = { enabled = "always" },
    },
  },
}
