function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
map('i', 'jk', '<Esc>')           -- jk to escape
map('i', 'kj', '<Esc>')           -- kj to escape

-- Tab switch buffer
map('n','<TAB>', ':bnext<CR>')
map('n','<S-TAB>', ':bprevious<CR>')

map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- better window movement
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Find files using Telescope command-line sugar.
map ('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map ('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map ('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map ('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
