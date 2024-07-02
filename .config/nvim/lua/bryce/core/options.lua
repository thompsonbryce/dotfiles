vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2 --2 spaces for tabs
opt.shiftwidth = 2 --indent
opt.expandtab = true --tabs to spaces
opt.autoindent = true --copy indent from current line when starting new

opt.wrap = false

opt.ignorecase = true -- Ignore
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
