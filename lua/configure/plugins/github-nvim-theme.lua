-- https://github.com/projekt0n/github-nvim-theme

local utils = require("utils")

-- local style = "dimmed"
local style = "light_default"

require("github-theme").setup(
    {
        theme_style = style,
        comment_style = "italic",
        keyword_style = "italic",
        function_style = "italic",
        variable_style = "italic"
    }
)

local colors = require("github-theme.palette." .. style)()

-- fidget
utils.hi.set("FidgetTitle", {fg = colors.syntax.string})
utils.hi.set("FidgetTask", {fg = colors.syntax.string, gui = "bold"})

if style == "dimmed" then
    -- lsp_signature and translate
    utils.hi.set("NormalFloat", {bg = colors.bg})
    utils.hi.set("FloatBorder", {bg = colors.bg, fg = colors.blue})
    --  bufferline
    utils.hi.set("Directory", {fg = colors.blue, gui = "bold", bg = colors.bg})
    -- nvim-tree
    utils.hi.set("NvimTreeFolderName", {fg = colors.syntax.string})
    utils.hi.set("NvimTreeFolderIcon", {fg = colors.syntax.string})
    utils.hi.set("NvimTreeOpenedFolderName", {fg = colors.syntax.string})
    utils.hi.set("NvimTreeEmptyFolderName", {fg = colors.syntax.string})
    utils.hi.set("NvimTreeOpenedFile", {fg = colors.red})
    utils.hi.set("NvimTreeRootFolder", {fg = colors.syntax.html_arg, gui = "bold"})
    -- lspsaga
    utils.hi.set("LspFloatWinNormal", {bg = colors.bg})
    utils.hi.set("LspSagaRenameBorder", {fg = colors.syntax.string})
    utils.hi.set("LspSagaHoverBorder", {fg = colors.syntax.string})
    utils.hi.set("LspSagaDocTruncateLine", {fg = colors.syntax.string})
    utils.hi.set("LspSagaDiagnosticBorder", {fg = colors.syntax.string})
    utils.hi.set("LspSagaDiagnosticTruncateLine", {fg = colors.syntax.string})
    -- telescope
    utils.hi.set("TelescopeBorder", {fg = colors.syntax.string})
    -- utils.hi.set("TelescopeSelection", {bg = colors.green, fg = colors.black0, gui = "NONE"})
    utils.hi.set("TelescopeMatching", {fg = colors.syntax.string, gui = "bold"})
    -- cmp match
    utils.hi.set("CmpItemAbbrMatch", {fg = colors.syntax.string, bg = "NONE"})
    utils.hi.set("CmpItemAbbrMatchFuzzy", {bg = "NONE", fg = colors.syntax.string})
    -- cmp selection
    utils.hi.set("PmenuSel", {bg = colors.green, fg = colors.bg2, gui = "NONE"})
    -- indent_blankline
    utils.hi.set("IndentBlanklineContextChar", {fg = colors.syntax.string})
    utils.hi.set("IndentBlanklineChar", {fg = colors.black})
    -- notify
    utils.hi.set("NotifyERRORBorder", {fg = colors.error})
    utils.hi.set("NotifyERRORIcon", {fg = colors.error})
    utils.hi.set("NotifyERRORTitle", {fg = colors.error, gui = "italic"})
    utils.hi.set("NotifyWARNBorder", {fg = colors.warning})
    utils.hi.set("NotifyWARNIcon", {fg = colors.warning})
    utils.hi.set("NotifyWARNTitle", {fg = colors.warning, gui = "italic"})
    utils.hi.set("NotifyINFOBorder", {fg = colors.info})
    utils.hi.set("NotifyINFOIcon", {fg = colors.info})
    utils.hi.set("NotifyINFOTitle", {fg = colors.info, gui = "italic"})
    -- which key
    utils.hi.set("WhichKey", {fg = colors.bright_green})
    utils.hi.set("WhichKeyGroup", {fg = colors.syntax.string})
    utils.hi.set("WhichKeyDesc", {fg = colors.yellow})
    utils.hi.set("WhichKeySeperator", {fg = colors.black})
    utils.hi.set("WhichKeyValue", {fg = colors.black})
    -- ts_rainbow.lua
    utils.hi.set("rainbowcol1", {fg = colors.syntax.keyword, bg = colors.bg})
    utils.hi.set("rainbowcol2", {fg = colors.syntax.param, bg = colors.bg})
    utils.hi.set("rainbowcol3", {fg = colors.syntax.constant, bg = colors.bg})
    utils.hi.set("rainbowcol4", {fg = colors.syntax.tag, bg = colors.bg})
    utils.hi.set("rainbowcol5", {fg = colors.syntax.html_arg, bg = colors.bg})
    utils.hi.set("rainbowcol6", {fg = colors.syntax.json_label, bg = colors.bg})
    utils.hi.set("rainbowcol7", {fg = colors.syntax.match_paren_bg, bg = colors.bg})
    -- hop
    utils.hi.set("HopNextKey", {fg = colors.green, bg = colors.bg, gui = "bold,underline"})
    utils.hi.set("HopNextKey1", {fg = colors.yellow, bg = colors.bg, gui = "bold"})
    utils.hi.set("HopNextKey2", {fg = colors.red, bg = colors.bg, gui = "bold,italic"})
    utils.hi.set("HopUnmatched", {fg = colors.syntax.comment, bg = colors.bg})
end
