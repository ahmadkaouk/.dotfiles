local telescope = require 'telescope'
local actions = require 'telescope.actions'
telescope.setup{
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        }
    },
    pickers = {
        find_files = { previewer = false },
        git_files = { previewer = false },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
        frecency = { 
            ignore_patterns = {"*.git/*", "*/tmp/*"},
            show_unindexed = true,
            workspaces = { 
                ["dotfiles"]    = "/home/Ahmad/.dotfiles/",
                ["repos"]    = "~/Ahmad/repos/"
            },
        },
    },
}

local ak = require("ak.settings")
local map = ak.map

map("n", "<leader>f", ":Telescope find_files <CR>")
map("n", "<leader>o", ":Telescope oldfiles <CR>")
map("n", "<leader>l", ":Telescope live_grep <CR>")
map("n", "<leader>g", ":Telescope grep_string <CR>")
map("n", "<leader>ff", ":Telescope frecency<CR>")

telescope.load_extension("frecency")
telescope.load_extension('fzf')

