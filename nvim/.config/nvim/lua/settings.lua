local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
o.termguicolors = true
w.cursorline = true
o.hidden = true
w.number = true
w.relativenumber = true
o.ignorecase = true
o.smartcase = true
b.shiftwidth = indent
b.tabstop = indent
b.expandtab = true
b.smartindent = true
b.autoindent = true
o.splitbelow = true
o.splitright = true
o.clipboard ='unnamed,unnamedplus'
o.swapfile = false
o.signcolumn = 'yes'
b.undofile = true
o.undodir = '$HOME/.config/nvim/undo'
b.undolevels = 10000
o.undoreload = 10000
o.mouse = 'a'

cmd 'command! MakeTags !ctags -R .' 
-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
