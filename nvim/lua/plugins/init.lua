vim.cmd 'packadd packer.nvim'

require('packer').startup(function()
    use { "wbthomason/packer.nvim", cmd = { "PackerSync", "PackerCompile", "PackerClean"}, }
    use { "nvim-lua/plenary.nvim", }
    use { "nvim-lua/popup.nvim", }
    -- Search [ Telescope ]
    use { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', config = [[require('plugins.telescope')]], }
    use {'nvim-telescope/telescope-fzy-native.nvim', run = 'make',}
    -- Highlight
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = [[require('plugins.treesitter')]],
    }
    use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter', }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', }
    -- lsp
    -- use { "neovim/nvim-lspconfig", wants = "nvim-cmp", event = "BufRead", config = [[require('plugins.lspconfig')]], }
    -- use { "simrat39/rust-tools.nvim", }
    -- autocompletions and snippets
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     event = "BufRead",
    --     after = "nvim-lspconfig",
    --     config = [[require('plugins.cmp')]],
    --     wants = "LuaSnip",
    --     requires = {
    --         {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
    --         {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp', },
    --         { "L3MON4D3/LuaSnip", after = "cmp-nvim-lsp", },
    --         { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp", },
    --     },
    -- }
    -- Misc
    use { "tpope/vim-surround", event = "BufRead", }
    use { "tpope/vim-commentary", event = "BufRead", }
    use { "justinmk/vim-sneak", event = "BufRead", }
    use { "aserowy/tmux.nvim"  }
end)
