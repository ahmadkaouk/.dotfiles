require('base16-colorscheme').setup({
    base00 = '#292d3e', base01 = '#444267', base02 = '#32374d', base03 = '#676e95',
    base04 = '#8796b0', base05 = '#959dcb', base06 = '#959dcb', base07 = '#ffffff',
    base08 = '#f07178', base09 = '#f78c6c', base0A = '#ffcb6b', base0B = '#c3e88d',
    base0C = '#89ddff', base0D = '#82aaff', base0E = '#c792ea', base0F = '#ff5370'
})
--  local monokai = {
--     base00 = '#2D2A2E', base01 = '#383830', base02 = '#49483e', base03 = '#75715e',
--     base04 = '#a59f85', base05 = '#f8f8f2', base06 = '#f5f4f1', base07 = '#f9f8f5',
--     base08 = '#FF6188', base09 = '#FC9867', base0A = '#FFD866', base0B = '#A9DC76',
--     base0C = '#a1efe4', base0D = '#78DCE8', base0E = '#AB9DF2', base0F = '#cc6633'
-- }
local cmd = vim.cmd

function bg(group, col)
    cmd("hi " .. group .. " guibg=" .. col)
end

function fg(group, col)
    cmd("hi " .. group .. " guifg=" .. col)
end

function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end


fg("IndentBlanklineChar", "#3b415c")
cmd("hi TSKeyword gui=italic")
cmd("hi TSKeywordFunction gui=italic")
cmd("hi TSConditional gui=italic")
cmd("hi TSString gui=italic")
cmd("hi TSRepeat gui=italic")

-- Monokai
-- fg("TSVariable", "#fff1f3")
-- fg("TSRepeat", "#c792ea")
-- fg("TSPath", "#cccccc")
-- fg("rainbowcol2","#FC9867")
-- fg("rainbowcol1","#ff6188")

-- Palenight
fg("TSVariable", "#ffcb6b")
fg("TSRepeat", "#c792ea")
fg("TSPath", "#cccccc")
fg("TSFuncMacro", "#82aaff")
fg("TSNamespace", "#cccccc")
fg("TSPunctDelimiter", "#cccccc")
fg("LineNr", "#4c5374")
fg("rainbowcol2","#c792ea")
fg("rainbowcol1","#ffcb6b")
bg("BufferLineFill", "#31364a")
