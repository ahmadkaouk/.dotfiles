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
opt.fillchars = { eob = ' ', fold = ' ', foldopen = '▾', foldsep = '│', foldclose = '▸'}
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = 'screenline,number'
opt.termguicolors = true
opt.mouse = "a"                     -- Enable Mouse
opt.clipboard = "unnamedplus"       -- allow neovim to access the system clipboard
opt.swapfile =  false
opt.undofile = true
opt.ignorecase = true
opt.statusline = '%2{mode()} | %f %m %r %= %{&spelllang} %y %8(%l,%c%) %8p%%'
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}]]
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
opt.list = true                     -- show trailing whitespaces
opt.listchars = { trail = '•' }
-- ###################################
-- Completions Options
-- ###################################
opt.pumheight = 15                  -- Pop-up menu height
opt.completeopt = { 'menuone', 'noselect', 'preview' }
-- ###################################
-- Fold
-- ###################################
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 20

function _G.custom_fold()
    local line = vim.fn.getline(vim.v.foldstart)
    return ' ' .. line
end

opt.foldtext = 'v:lua.custom_fold()'
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
map("v", "<localleader>d", '"_d')
-- ###################################
-- Navigation
-- ###################################
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")
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
-- ###################################
-- Buffer and Window Management
-- ###################################
map("n", "<localleader>w", ":w <CR>")       -- save file
map("n", "<localleader>b", ":bw <CR>")      -- quit buffer
map("n", "<localleader>q", ":q <CR>")       -- quit window
map("n", "<localleader>Q", ":q! <CR>")      -- quit window
map("n", "<TAB>", ":bn <CR>")
map("n", "<S-TAB>", ":bp <CR>")
-- Indentation
map("v", ">", ">gv")
map("v", "<", "<gv")
map("n", "<localleader>n", ":noh <CR>")     -- turn off search highlighting

-- ##########################################################################
-- 3. Plugins
-- ##########################################################################
require("plugins")
-- ###################################
-- Telescope
-- ###################################
map("n", "<leader>p", ":Telescope find_files <CR>")
map("n", "<leader>g", ":Telescope git_files<CR>")
map("n", "<leader>z", ":Telescope zoxide list<CR>")
map("n", "<leader>o", ":Telescope oldfiles <CR>")
map("n", "<leader>b", ":Telescope buffers <CR>")
map("n", "<leader>ff", ":Telescope live_grep <CR>")
map("n", "<leader>f", ":Telescope grep_string <CR>")
-- ###################################
-- Tmux
-- ###################################
require("tmux").setup({
    copy_sync = { enable = true, },
    navigation = { enable_default_keybindings = true, },
    resize = { enable_default_keybindings = true, }
})
-- ###################################
-- Git
-- ###################################
function _G.gitsigns()
    require('gitsigns').setup({
        signs = {
            add = { text = '▌' },
            change = { text = '▌' },
            delete = { text = '▌' },
            topdelete = { text = '▌' },
            changedelete = { text = '▌' },
        },
    })
end

local cmd = vim.cmd
cmd("hi Pmenu guibg=#222222")
cmd("hi VertSplit guifg=#2d2a2e guibg=#222222")
cmd("hi TSComment guifg=grey gui=italic")
cmd("hi LineNr guifg=grey")
cmd("hi SignColumn guibg=none")
cmd("hi FloatBorder guibg=#222222")
