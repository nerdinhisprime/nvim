local opt = vim.opt

-- tabs ----------------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.expandtab = true

-- search ------------------------------
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- ui base -------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- ui optional -----------------------------
opt.signcolumn = "yes"
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = {
	tab = "» ",
	trail = ".",
	nbsp = "+",
}
