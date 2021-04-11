require "../colorscheme"

-- colors for active , inactive uffer tabs
require "bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thick"
    },
    highlights = {
        background = {
            guifg = comment_fg,
            guibg = colors.background,
        },
        fill = {
            guifg = comment_fg,
            guibg = colors.background,
        },
        buffer_selected = {
            guifg = colors.orange,
            guibg = colors.background,
            gui = "bold"
        },
        buffer_visible = {
            guifg = "#3e4451",
            guibg = colors.background,
        },
        separator_visible = {
            guifg = colors.grey,
            guibg = colors.background
        },
        separator_selected = {
            guibg = colors.background
        },
        separator = {
	guifg = colors.background,
            guibg = colors.background
        },
        indicator_selected = {
            guifg = colors.orange,
            guibg = colors.background
        },
        modified_selected = {
            guifg = string_fg,
            guibg = colors.background
        }
    }
}

local opt = {silent = true}

vim.g.mapleader = " "

--command that adds new buffer and moves to it
vim.api.nvim_command "com -nargs=? -complete=file_in_path New badd <args> | blast"
vim.api.nvim_set_keymap("n", "<S-b>", ":New ", opt)

--removing a buffer
vim.api.nvim_set_keymap("n", "<S-f>", [[<Cmd>bdelete<CR>]], opt)

-- tabnew and tabprev
vim.api.nvim_set_keymap("n", "<S-l>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<S-s>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
