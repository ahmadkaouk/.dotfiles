vim.cmd('let g:nvcode_termcolors=256')
local base16 = require "base16"
base16(base16.themes[O.colorscheme], true)

function hi (object, guifg, guibg)
  local cmd = string.format("hi %s guifg=%s guibg=%s", object, guifg ,guibg)
  vim.cmd(cmd)
end
colors = {
background = "#212121",
foreground = "#c4c4b5",
black = "#212121",
red = "#f82a71",
green = "#a6e12d",
orange = "#fd971e",
yellow = "#dfd561",
blue = "#ae80fe",
cyan = "#63d5eb",
grey = "#42464e",
light_grey = "#383838",
dark_grey = "#747474",
white = "#f6f6ee"
}

-- highlights --
local cmd = vim.cmd
hi("LineNr", colors.grey, "NONE")
hi("Comment", colors.dark_grey, "NONE")
hi("EndOfBuffer", colors.background, colors.background)
hi("Normal", "NONE", colors.background)
hi("DiffAdd", colors.green, "NONE")
hi("DiffChange", colors.orange, "NONE")
hi("DiffModified", colors.orange, "NONE")
hi("DiffDelete", colors.red, "NONE")
hi("DiffDelete", colors.red, "NONE")
hi("IndentBlanklineChar", colors.light_grey, "NONE")
hi("IndentBlanklineContextChar", colors.orange, "NONE")

cmd "hi SignColumn guibg=NONE"
cmd "hi VertSplit guibg=NONE guifg=#2a2e36"
cmd "hi PmenuSel guibg=#98c379"
cmd "hi Pmenu  guibg=#282c34"

