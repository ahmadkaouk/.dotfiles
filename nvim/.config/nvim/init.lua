local opt = vim.opt
-- ##########################################################################
-- 1. Basic Settings
-- ##########################################################################
opt.path = {".", "**"}              -- relative to current file and everything under :pwd
opt.tags = {"./tags", ",tags"}
opt.timeoutlen = 400                -- time to wait for a mapped sequence to complete
opt.hidden = true                   -- Kepp buffers opened
opt.splitbelow = true
opt.splitright = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.mouse = "a"                     -- Enable Mouse
opt.clipboard = "unnamedplus"       -- allow neovim to access the system clipboard
opt.swapfile =  false
opt.undofile = true
opt.ignorecase = true
-- ###################################
-- Command Line Stuff
-- ###################################
opt.wildmode = 'longest:full,full'  -- Shows a menu bar as opposed to an enormous list
opt.wildoptions = 'pum'
opt.pumblend = 3                    -- Make popup window transparent
opt.wildignore = {"**/node_modules/**", "**/dist/**", "*.pyc"}
-- grep program
opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
opt.grepformat = "%f:%l:%c:%m"

-- ###################################
-- Indentation
-- ###################################
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
-- ###################################
-- Completions Options
-- ###################################
opt.pumheight = 15                  -- Pop-up menu height
opt.completeopt = { 'menuone', 'noselect', 'preview' }
-- ##########################################################################
-- 2. Mappings
-- ##########################################################################
vim.g.mapleader = " "
vim.g.maplocalleader = ","
local map = function(mode, keys, cmd, opt)
    local options = opt or { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, keys, cmd, options)
end
-- ###################################
-- Escape
-- ###################################
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("n", "<C-p>", ":",{ noremap = true, silent = false })
-- ###################################
-- Copy and Paste
-- ###################################
map("o", "L", "$")
map("o", "H", "^")
map("v", "p", "pgvy")
--- ###################################
--- Buffer and Window Management
--- ###################################
map("n", "<localleader>w", ":w <CR>")       -- save file
map("n", "<localleader>c", ":bw <CR>")      -- quit buffer
map("n", "<localleader>q", ":q <CR>")       -- quit window
map("n", "<localleader>Q", ":q! <CR>")       -- quit windowap("v", "<localleader>d", '"_d')
-- ###################################
-- Navigation
-- ###################################
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")
map("i", "<C-i>" , "<ESC>^i")
map("i", "<C-e>" , "<End>")
-- ###################################
-- Lists and tags
-- ###################################
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
-- Indentation
map("v", ">", ">gv")
map("v", "<", "<gv")
map("n", "<C-n>", ":noh <CR>")              -- turn off search highlighting
map("n", "<localleader>f", ":set foldlevel=1<CR>") -- fold
