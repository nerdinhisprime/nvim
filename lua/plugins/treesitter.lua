return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "javascript", "typescript", "html", "vue", "css", "markdown" })
	end,
}
