return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"jsonls",
				"bashls",
				"vtsls",
				"vue_ls",
				"emmet_ls",
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp = vim.lsp
		local vue_plugins = {
			name = "@vue/typescript-plugin",
			location = "/usr/lib/node_modules/@vue/language-server", -- пофиксить!
			--location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		lsp.config("html", { capabilities = capabilities })

		lsp.config("cssls", { capabilities = capabilities })

		lsp.config("jsonls", { capabilities = capabilities })

		lsp.config("bashls", { capabilities = capabilities })

		lsp.config("vtsls", {
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							vue_plugins,
						},
					},
				},
			},
			filetypes = { "typescript", "javascript", "vue" },
		})

		lsp.enable({
			"lua_ls",
			"html",
			"cssls",
			"jsonls",
			"bashls",
			"vtsls",
			"vue_ls",
			"emmet_ls",
		})
	end,
}
