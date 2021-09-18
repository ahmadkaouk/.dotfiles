local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    use { "nvim-lua/plenary.nvim", }
    use { "nvim-lua/popup.nvim", }
    use { 'kyazdani42/nvim-web-devicons' }
    -- Search [ Telescope ]
    use { 'nvim-telescope/telescope.nvim', }
    use { "nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua",} }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- Highlight
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",}
    use { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle", }
    use {'nvim-treesitter/nvim-treesitter-refactor', }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', branch = '0.5-compat', }
    -- lsp
    use { "neovim/nvim-lspconfig", }
    -- autocompletions and snippets
    use { 'hrsh7th/nvim-cmp', }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    -- Git
    use { 'lewis6991/gitsigns.nvim', config = [[require('gitsigns').setup()]], }
    -- themes
    use "projekt0n/github-nvim-theme"
    use "aserowy/tmux.nvim"
end)
