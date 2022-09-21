local telescope = require('telescope')
telescope.setup{
    defaults = {
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            width = 0.90,
            height = 0.90,
            preview_cutoff = 100,
        },
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
            results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 0.80,
                height = 0.80,
            },
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
        },
        git_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 0.80,
                height = 0.80,
            },
        },
        oldfiles = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 0.80,
                height = 0.80,
            },
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
    },
}

telescope.load_extension('fzy_native')
telescope.load_extension('zoxide')
