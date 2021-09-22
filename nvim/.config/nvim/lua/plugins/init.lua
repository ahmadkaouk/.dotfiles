vim.cmd 'packadd packer.nvim'
return require('packer').startup(function()
    use { "wbthomason/packer.nvim", cmd = { "PackerSync", "PackerCompile", "PackerClean"}, }
    use { "nvim-lua/plenary.nvim", }
    use { "nvim-lua/popup.nvim", }
    use { 'kyazdani42/nvim-web-devicons' }
    -- Search [ Telescope ]
    use { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', config = [[require('plugins.telescope')]], }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make',}
    -- Highlight
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = [[require ('plugins.treesitter')]],
    }
    use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter', }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', }
    -- lsp
    use { "neovim/nvim-lspconfig", event = "BufRead", config = [[require('plugins.lspconfig')]], }
    -- autocompletions and snippets
    use {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = [[require('plugins.cmp')]],
        requires = {
            {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
            { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp", },
        },
    }
    -- Misc
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use { "tpope/vim-surround", event = "BufRead", }
    use { "tpope/vim-commentary", event = "BufRead", }
    use { "justinmk/vim-sneak", event = "BufRead", }
    use { 'lewis6991/gitsigns.nvim', event = "BufRead", config = [[gitsigns()]], }
    use { "folke/zen-mode.nvim", config = [[ require("zen-mode").setup() ]], cmd = 'ZenMode', }
    use { 'numToStr/Navigator.nvim' }
    use { 'sbdchd/neoformat', cmd = "Neoformat", }
end)
