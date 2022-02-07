require'nvim-treesitter.configs'.setup {
    ensure_installed = { "rust", "go", "cpp", "c", "javascript", "lua", "python", "bash" },
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
                list_definitions = "gnD",
                goto_definition = "gnd",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
    rainbow = {
        enable = false,
    },
    pairs = {
        enable = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
    }
}
