-- https://github.com/Mofiqul/vscode.nvim

local options = require("core.options")
local utils = require("utils")

-- For dark theme
vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- transparent background
vim.g.vscode_transparent = options.transparency_background
-- Enable italic comment
vim.g.vscode_italic_comment = 0
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = false
vim.cmd([[colorscheme vscode]])

local colors = require("vscode.colors").generate()

local rainbow_level_1 = "#FFD700"
local rainbow_level_2 = "#DA70BF"
local rainbow_level_3 = "#87CEFA"
local select_blue = "#094771"
local nvim_tree_bg = "#242526"
local status_line_nc_bg = "#252526"

-- lsp_signature and translate
if options.transparency_background then
    utils.hi.set("NormalFloat", {bg = "NONE"})
else
    utils.hi.set("NormalFloat", {bg = colors.vscBack})
    utils.hi.set("FloatBorder", {fg = colors.vscMediumBlue, bg = colors.vscBack})
end

-- basic
-- Some places in markdown that are not wrong will be marked clearly
-- this is clearly not normal
utils.hi.set("markdownError", {fg = colors.vscFront, gui = "NONE"})

-- vim-illuminate
utils.hi.set("illuminatedWord", {bg = colors.vscSplitThumb})

-- nvim-tree
utils.hi.set("NvimTreeOpenedFolderName", {bg = "NONE", gui = "bold"})

-- scrollbar
utils.hi.set("ScrollbarHandle", {bg = colors.vscSplitThumb})

--  bufferline
utils.hi.set("BufferIndicator", {fg = colors.vscBack})
utils.hi.set("BufferDirectory", {fg = colors.vscLightBlue, bg = nvim_tree_bg, gui = "bold"})
utils.hi.set("StatusLineNC", {fg = colors.vscFront, bg = status_line_nc_bg})

-- fidget
utils.hi.set("FidgetTitle", {fg = colors.vscFront})
utils.hi.set("FidgetTask", {fg = colors.vscFront})

-- vim visual multi
utils.hi.set("VM_mode1", {fg = colors.vscBack, bg = colors.vscPopupHighlightLightBlue})
utils.hi.set("VM_mode2", {fg = colors.vscBack, bg = colors.vscUiOrange})

-- spell
utils.hi.set("SpellBad", {fg = colors.vscGreen})
utils.hi.set("SpellCap", {fg = colors.vscGreen})
utils.hi.set("SpellRare", {fg = colors.vscGreen})
utils.hi.set("SpellLocal", {fg = colors.vscGreen})

-- lspsaga
utils.hi.set("LspFloatWinNormal", {bg = colors.vscBack})
utils.hi.set("LspSagaRenameBorder", {fg = colors.vscMediumBlue})
utils.hi.set("LspSagaHoverBorder", {fg = colors.vscMediumBlue})
utils.hi.set("LspSagaDocTruncateLine", {fg = colors.vscMediumBlue})
utils.hi.set("LspSagaDiagnosticBorder", {fg = colors.vscMediumBlue})
utils.hi.set("LspSagaDiagnosticTruncateLine", {fg = colors.vscMediumBlue})

-- telescope
utils.hi.set("TelescopeBorder", {fg = colors.vscMediumBlue})
utils.hi.set("TelescopePreviewBorder", {fg = colors.vscMediumBlue})
utils.hi.set("TelescopePromptBorder", {fg = colors.vscMediumBlue})
utils.hi.set("TelescopeResultsBorder", {fg = colors.vscMediumBlue})

-- cmp selection
utils.hi.set("PmenuSel", {bg = select_blue, fg = colors.vscFront, gui = "NONE"})

-- cmp match
utils.hi.set("CmpItemAbbrMatch", {fg = colors.vscMediumBlue, bg = "NONE"})
utils.hi.set("CmpItemAbbrMatchFuzzy", {fg = colors.vscMediumBlue, bg = "NONE"})

-- indent_blankline
utils.hi.set("IndentBlanklineContextChar", {fg = colors.vscLightBlue})
utils.hi.set("IndentBlanklineContextStart", {fg = "NONE", gui = "underline"})

-- hop
utils.hi.set("HopNextKey", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,underline"})
utils.hi.set("HopNextKey1", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold"})
utils.hi.set("HopNextKey2", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,italic"})

-- ts_rainbow.lua
utils.hi.set("rainbowcol1", {fg = rainbow_level_1})
utils.hi.set("rainbowcol2", {fg = rainbow_level_2})
utils.hi.set("rainbowcol3", {fg = rainbow_level_3})
utils.hi.set("rainbowcol4", {fg = rainbow_level_1})
utils.hi.set("rainbowcol5", {fg = rainbow_level_2})
utils.hi.set("rainbowcol6", {fg = rainbow_level_3})
utils.hi.set("rainbowcol7", {fg = rainbow_level_1})

-- notify
utils.hi.set("NotifyERRORBorder", {fg = colors.vscRed})
utils.hi.set("NotifyERRORIcon", {fg = colors.vscRed})
utils.hi.set("NotifyERRORTitle", {fg = colors.vscRed, gui = "italic"})
utils.hi.set("NotifyWARNBorder", {fg = colors.vscYellow})
utils.hi.set("NotifyWARNIcon", {fg = colors.vscYellow})
utils.hi.set("NotifyWARNTitle", {fg = colors.vscYellow, gui = "italic"})
utils.hi.set("NotifyINFOBorder", {fg = colors.vscMediumBlue})
utils.hi.set("NotifyINFOIcon", {fg = colors.vscMediumBlue})
utils.hi.set("NotifyINFOTitle", {fg = colors.vscMediumBlue, gui = "italic"})
