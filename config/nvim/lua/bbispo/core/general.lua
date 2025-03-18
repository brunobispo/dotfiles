-- general
vim.opt.encoding = "UTF-8"
vim.opt.hidden = true
vim.opt.autochdir = false
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.timeout = false
vim.opt.mouse = "a"
vim.opt.exrc = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- folding
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- others
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
vim.opt.spelllang = "en"
vim.opt.wrap = false
