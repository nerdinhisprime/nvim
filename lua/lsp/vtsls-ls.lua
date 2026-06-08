local function get_vue_plugin_path()
  local paths = {
    vim.fn.getcwd() .. "/node_modules/@vue/language-server",
    "/usr/lib/node_modules/@vue/language-server",
    vim.fn.expand("$HOME/.local/share/npm-global/lib/node_modules/@vue/language-server"),
    vim.fn.trim(vim.fn.system("npm root -g")) .. "/@vue/language-server",
  }

  for _, path in ipairs(paths) do
    if vim.fn.isdirectory(path) == 1 then
      return path
    end
  end

  return ""
end

return {
  settings = {
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = "all" },
        variableTypes = { enabled = "all" },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = { completeFunctionCalls = true },
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = "all" },
        variableTypes = { enabled = "all" },
      },
    },
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = get_vue_plugin_path(),
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
}
