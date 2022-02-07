local telescope = require('telescope')
telescope.setup{
    defaults = {
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        border = {},
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
                width = 100,
                height = 20
            },
        },
        git_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 100,
                height = 20
            },
        },
        oldfiles = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 100,
                height = 20
            },
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 100,
                height = 20
            },
        },
    },
}

telescope.load_extension('fzy_native')
