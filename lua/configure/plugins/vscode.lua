-- https://github.com/Mofiqul/vscode.nvim

local options = require("core.options")
local api = require("utils.api")

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

if vim.g.vscode_style == "dark" then
    local rainbow_level_1 = "#FFD700"
    local rainbow_level_2 = "#DA70BF"
    local rainbow_level_3 = "#87CEFA"
    local select_blue = "#094771"
    local nvim_tree_bg = api.hi.get("NvimTreeNormal", "bg")
    local status_line_nc_bg = api.hi.get("StatusLineNC", "bg")

    -- lsp_signature and translate
    if options.transparency_background then
        api.hi.set("NormalFloat", {bg = "NONE"})
    else
        api.hi.set("NormalFloat", {bg = colors.vscBack})
        api.hi.set("FloatBorder", {fg = colors.vscMediumBlue, bg = colors.vscBack})
    end

    -- basic
    -- Some places in markdown that are not wrong will be marked clearly
    -- this is clearly not normal
    api.hi.set("markdownError", {fg = colors.vscFront, gui = "NONE"})

    -- vim-illuminate
    api.hi.set("illuminatedWord", {bg = colors.vscSplitThumb})

    -- nvim-tree
    api.hi.set("NvimTreeOpenedFolderName", {bg = "NONE", gui = "bold"})

    -- scrollbar
    api.hi.set("ScrollbarHandle", {bg = colors.vscSplitThumb})

    --  bufferline
    api.hi.set("BufferIndicator", {fg = colors.vscBack})
    api.hi.set("BufferDirectory", {fg = colors.vscLightBlue, bg = nvim_tree_bg, gui = "bold"})
    api.hi.set("StatusLineNC", {fg = colors.vscFront, bg = status_line_nc_bg})

    -- fidget
    api.hi.set("FidgetTitle", {fg = colors.vscFront})
    api.hi.set("FidgetTask", {fg = colors.vscFront})

    -- vim visual multi
    api.hi.set("VM_mode1", {fg = colors.vscBack, bg = colors.vscPopupHighlightLightBlue})
    api.hi.set("VM_mode2", {fg = colors.vscBack, bg = colors.vscUiOrange})

    -- spell
    api.hi.set("SpellBad", {fg = colors.vscGreen})
    api.hi.set("SpellCap", {fg = colors.vscGreen})
    api.hi.set("SpellRare", {fg = colors.vscGreen})
    api.hi.set("SpellLocal", {fg = colors.vscGreen})

    -- lspsaga
    api.hi.set("LspFloatWinNormal", {bg = colors.vscBack})
    api.hi.set("LspSagaRenameBorder", {fg = colors.vscMediumBlue})
    api.hi.set("LspSagaHoverBorder", {fg = colors.vscMediumBlue})
    api.hi.set("LspSagaDocTruncateLine", {fg = colors.vscMediumBlue})
    api.hi.set("LspSagaDiagnosticBorder", {fg = colors.vscMediumBlue})
    api.hi.set("LspSagaDiagnosticTruncateLine", {fg = colors.vscMediumBlue})

    -- telescope
    api.hi.set("TelescopeBorder", {fg = colors.vscMediumBlue})
    api.hi.set("TelescopePreviewBorder", {fg = colors.vscMediumBlue})
    api.hi.set("TelescopePromptBorder", {fg = colors.vscMediumBlue})
    api.hi.set("TelescopeResultsBorder", {fg = colors.vscMediumBlue})

    -- cmp selection
    api.hi.set("PmenuSel", {bg = select_blue, fg = colors.vscFront, gui = "NONE"})

    -- cmp match
    api.hi.set("CmpItemAbbrMatch", {fg = colors.vscMediumBlue, bg = "NONE"})
    api.hi.set("CmpItemAbbrMatchFuzzy", {fg = colors.vscMediumBlue, bg = "NONE"})

    -- indent_blankline
    api.hi.set("IndentBlanklineContextChar", {fg = colors.vscLightBlue})
    api.hi.set("IndentBlanklineContextStart", {fg = "NONE", gui = "underline"})

    -- hop
    api.hi.set("HopNextKey", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,underline"})
    api.hi.set("HopNextKey1", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold"})
    api.hi.set("HopNextKey2", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,italic"})

    -- ts_rainbow.lua
    api.hi.set("rainbowcol1", {fg = rainbow_level_1})
    api.hi.set("rainbowcol2", {fg = rainbow_level_2})
    api.hi.set("rainbowcol3", {fg = rainbow_level_3})
    api.hi.set("rainbowcol4", {fg = rainbow_level_1})
    api.hi.set("rainbowcol5", {fg = rainbow_level_2})
    api.hi.set("rainbowcol6", {fg = rainbow_level_3})
    api.hi.set("rainbowcol7", {fg = rainbow_level_1})

    -- notify
    api.hi.set("NotifyERRORBorder", {fg = colors.vscRed})
    api.hi.set("NotifyERRORIcon", {fg = colors.vscRed})
    api.hi.set("NotifyERRORTitle", {fg = colors.vscRed, gui = "italic"})
    api.hi.set("NotifyWARNBorder", {fg = colors.vscYellow})
    api.hi.set("NotifyWARNIcon", {fg = colors.vscYellow})
    api.hi.set("NotifyWARNTitle", {fg = colors.vscYellow, gui = "italic"})
    api.hi.set("NotifyINFOBorder", {fg = colors.vscMediumBlue})
    api.hi.set("NotifyINFOIcon", {fg = colors.vscMediumBlue})
    api.hi.set("NotifyINFOTitle", {fg = colors.vscMediumBlue, gui = "italic"})
end
