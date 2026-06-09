local npm_root = vim.trim(vim.fn.system("npm root -g"))
local vue_plugin_path = npm_root .. "/@vue/language-server/node_modules/@vue/typescript-plugin"

local is_vue_plugin_installed = vim.fn.isdirectory(vue_plugin_path) == 1

return {
  cmd = { "vtsls", "--stdio" },

  filetypes = is_vue_plugin_installed
      and { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
      or { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },

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
