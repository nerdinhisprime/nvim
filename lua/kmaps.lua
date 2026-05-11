-- require("yazi")

vim.g.mapleader = " "
local map = vim.keymap.set

local mods = { "n", "i" }

-- save/quit
map(mods, "<C-s>", "<cmd>w<cr>")
map(mods, "<C-q>", "<cmd>q<cr>")

-- buffers
map("n", "]b", "<cmd>bprev<cr>")
map("n", "[b", "<cmd>bnext<cr>")
map("n", "bd", "<cmd>bdelete<cr>")
map("n", "b<tab>", ":b ")

-- terminal
map("n", "<leader>t", function()
	vim.cmd("botright split | terminal")
	--os.execute("foot &")
end)
