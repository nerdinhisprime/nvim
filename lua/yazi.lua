vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local M = {}

function M.open_yazi()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})

	local tmpfile = vim.fn.tempname()

	vim.fn.termopen({
		"yazi",
		"--chooser-file",
		tmpfile,
		vim.fn.expand("%:p:h"),
	}, {
		on_exit = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end

			-- безопасная проверка файла
			if vim.fn.filereadable(tmpfile) == 1 then
				local lines = vim.fn.readfile(tmpfile)
				if #lines > 0 and lines[1] ~= "" then
					vim.cmd.edit(vim.fn.fnameescape(lines[1]))
				end
				vim.fn.delete(tmpfile)
			end
		end,
	})

	vim.cmd("startinsert")
end

return M
