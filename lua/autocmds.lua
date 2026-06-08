local autocmd = vim.api.nvim_create_autocmd
local stdpath = vim.fn.stdpath

-- autoupdates --
autocmd("BufWritePost", {
	pattern = {
		stdpath("config") .. "/init.lua",
		stdpath("config") .. "/lua/**/*.lua",
	},
	callback = function(args)
		vim.cmd("source " .. args.file)
	end,
})

-- treesitter highlight --
autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
