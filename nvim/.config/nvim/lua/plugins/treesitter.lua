require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "python", "rust", "lua"},
    highlight = {
        enable = true,
        use_languagetree = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>a", -- maps in normal mode to init the node/scope selection
            node_incremental = "<leader>a", -- increment to the upper named parent
            node_decremental = "<leader>A", -- decrement to the previous node
            scope_incremental = "<leader>e", -- increment to the upper scope (as defined in locals.scm)
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',
            },
        },
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
            },
        },
    },
}