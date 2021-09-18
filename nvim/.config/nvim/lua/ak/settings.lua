local opt = vim.opt
local ak = {}
-----------------------------------------------------------------------------//
-- Global {{{1
-----------------------------------------------------------------------------//
-- Basics
opt.path = {".", "**"}             -- relative to current file and everything under :pwd
opt.tags = {"./tags", ",tags"}
opt.timeoutlen = 400               -- time to wait for a mapped sequence to complete
opt.hidden = true                  -- Kepp buffers opened
opt.splitbelow = true
opt.splitright = true
opt.fillchars = { eob = ' '}       -- suppress ~ at EndOfBuffer
-----------------------------------------------------------------------------//
-- Command Line Stuff
opt.wildmode = 'longest:full,full' -- Shows a menu bar as opposed to an enormous list
opt.wildoptions = 'pum'
vim.opt.pumblend = 3               -- Make popup window transparent
opt.wildignore = {"**/node_modules/**", "**/dist/**", "*.pyc"}
-- grep program
opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
opt.grepformat = "%f:%l:%c:%m"
-----------------------------------------------------------------------------//
-- Indentation
opt.wrap = true
opt.wrapmargin = 2
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.list = true   -- show trailing whitespaces
-----------------------------------------------------------------------------//
-- Completions Options
vim.opt.pumheight = 15  -- Pop-up menu height
vim.opt.completeopt = { 'menuone', 'noselect', 'preview' }
-- Search & Replace Options
opt.ignorecase = true
-----------------------------------------------------------------------------//
-- Misc
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = 'screenline,number'
opt.termguicolors = true
opt.mouse = "a"                    -- Enable Mouse
opt.clipboard = "unnamedplus"      -- allow neovim to access the system clipboard
-- backup and swaps 
opt.swapfile =  false
opt.undofile = true

require('github-theme').setup({
  function_style = "bold",
  sidebars = {"terminal", "packer"},
  hide_inactive_statusline = false,
})
-----------------------------------------------------------------------------//
-- Mappings {{{1
-----------------------------------------------------------------------------//
vim.g.mapleader = " "
vim.g.maplocalleader = ","
ak.map = function (mode, key, cmd, opt)
   local options = opt or { noremap = true, silent = true }
   vim.api.nvim_set_keymap(mode, key, cmd, options)
end

local map = ak.map
-- Escape
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("n", "<C-p>", ":",{ noremap = true, silent = false })
-----------------------------------------------------------------------------//
-- Navigation
-- File Navigation
map("n", "<localleader>f", ":find *",{ noremap = true, silent = false })
map("n", "<localleader>v", ":vert sfind *",{ noremap = true, silent = false })
map("n", "<localleader>g", ":g//#<Left><Left>",{ noremap = true, silent = false })
map("n", ",F", ":find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>", { noremap = true, silent = false })
map ("n", ",V", ":vert sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>", { noremap = true, silent = false })
-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
-- Inset Mode navigation
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")
map("i", "<C-i>" , "<ESC>^i")
map("i", "<C-e>" , "<End>")
-----------------------------------------------------------------------------//
-- Lists and tags
-- Arglists
map("n", "(a", ":previous<CR>")
map("n", ")a", ":next<CR>")
map("n", "(A", ":first<CR>")
map("n", ")A", ":last<CR>")
-- Quick Fix List
map("n", "(q", ":cp<CR>")
map("n", ")q", ":cn<CR>")
-- tags
map("n", "<localleader>t", "g<C-]>")
map("n", "(t", ":tprevious<CR>")
map("n", ")t", ":tnext<CR>")
-----------------------------------------------------------------------------//
-- Buffer and Window Management
map("n", "<localleader>b", ":buffers<CR>:buffer ", { noremap = true, silent = false }) -- cycle through buffers 
map("n", "<localleader>w", ":w <CR>")        -- save file
map("n", "<localleader>bw", ":bw <CR>")      -- quit buffer 
map("n", "<localleader>q", ":q <CR>")        -- quit window 
-- Indentation
map("v", ">", ">gv")
-----------------------------------------------------------------------------//
-- Misc
map("v", "<", "<gv")
map("n", "<Esc>", ":noh <CR>") -- turn off search highlighting

return ak
