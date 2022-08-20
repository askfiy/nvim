local hl = require("utils.api.hl")
local options = require("core.options")
local colors = require("catppuccin.api.colors").get_colors()

local M = {}

function M.global_highlight()
    hl.bulk_set({
        -- split
        ["VertSplit"] = { fg = colors.blue, bold = true },

        -- winbar
        ["WinBar"] = { bold = false },

        -- packer
        ["packerFail"] = { fg = colors.red },

        -- scroll
        ["ScrollView"] = { bg = colors.black4 },

        -- nvim-tree
        ["NvimTreeWindowPicker"] = { fg = colors.pink, bg = colors.black0, bold = true },

        -- fidget
        ["FidgetTitle"] = { fg = colors.blue, bold = true },
        ["FidgetTask"] = { fg = colors.blue },

        -- indent-blankline
        ["IndentBlanklineContextChar"] = { fg = colors.blue },
        ["IndentBlanklineChar"] = { fg = colors.black4 },

        -- illuminate
        ["IlluminatedWordText"] = { bg = colors.black4 },
        ["IlluminatedWordRead"] = { bg = colors.black4 },
        ["IlluminatedWordWrite"] = { bg = colors.black4 },

        -- vim-visual-multi
        ["VM_Extend_hl"] = { fg = colors.black2, bg = colors.mauve },
        ["VM_Cursor_hl"] = { fg = colors.black2, bg = colors.mauve },
        ["VM_Mono_hl"] = { fg = colors.black2, bg = colors.blue },
        ["VM_insert_hl"] = { fg = colors.black2, bg = colors.red },

        -- cmp
        ["PmenuSel"] = { fg = colors.black0, bg = colors.green, bold = false },
        ["PmenuThumb"] = { bg = colors.black4 },
        ["CmpItemAbbrMatch"] = { fg = colors.blue, bold = true },
        ["CmpItemAbbrMatchFuzzy"] = { fg = colors.blue },

        -- -- diagnostic
        ["DiagnosticError"] = { fg = colors.red, bg = "none" },
        ["DiagnosticWarn"] = { fg = colors.yellow, bg = "none" },
        ["DiagnosticInfo"] = { fg = colors.blue, bg = "none" },
        ["DiagnosticHint"] = { fg = colors.blue, bg = "none" },

        -- rainbowcol
        ["rainbowcol1"] = { fg = colors.peach, bg = "none" },
        ["rainbowcol2"] = { fg = colors.mauve, bg = "none" },
        ["rainbowcol3"] = { fg = colors.teal, bg = "none" },
        ["rainbowcol4"] = { fg = colors.peach, bg = "none" },
        ["rainbowcol5"] = { fg = colors.mauve, bg = "none" },
        ["rainbowcol6"] = { fg = colors.teal, bg = "none" },
        ["rainbowcol7"] = { fg = colors.peach, bg = "none" },

        -- aerinal
        ["AerialArrayIcon"] = { fg = colors.blue },
        ["AerialBooleanIcon"] = { fg = colors.blue },
        ["AerialClassIcon"] = { fg = colors.blue },
        ["AerialConstantIcon"] = { fg = colors.blue },
        ["AerialConstructorIcon"] = { fg = colors.blue },
        ["AerialEnumIcon"] = { fg = colors.blue },
        ["AerialEnumMemberIcon"] = { fg = colors.blue },
        ["AerialEventIcon"] = { fg = colors.blue },
        ["AerialFieldIcon"] = { fg = colors.blue },
        ["AerialFileIcon"] = { fg = colors.blue },
        ["AerialFunctionIcon"] = { fg = colors.blue },
        ["AerialInterfaceIcon"] = { fg = colors.blue },
        ["AerialKeyIcon"] = { fg = colors.blue },
        ["AerialMethodIcon"] = { fg = colors.blue },
        ["AerialModuleIcon"] = { fg = colors.blue },
        ["AerialNamespaceIcon"] = { fg = colors.blue },
        ["AerialNullIcon"] = { fg = colors.blue },
        ["AerialNumberIcon"] = { fg = colors.blue },
        ["AerialObjectIcon"] = { fg = colors.blue },
        ["AerialOperatorIcon"] = { fg = colors.blue },
        ["AerialPackageIcon"] = { fg = colors.blue },
        ["AerialPropertyIcon"] = { fg = colors.blue },
        ["AerialStringIcon"] = { fg = colors.blue },
        ["AerialStructIcon"] = { fg = colors.blue },
        ["AerialTypeParameterIcon"] = { fg = colors.blue },
        ["AerialVariableIcon"] = { fg = colors.blue },

        -- navic
        ["NavicIconsFile"] = { fg = colors.blue },
        ["NavicIconsModule"] = { fg = colors.blue },
        ["NavicIconsNamespace"] = { fg = colors.blue },
        ["NavicIconsPackage"] = { fg = colors.blue },
        ["NavicIconsClass"] = { fg = colors.blue },
        ["NavicIconsMethod"] = { fg = colors.blue },
        ["NavicIconsProperty"] = { fg = colors.blue },
        ["NavicIconsField"] = { fg = colors.blue },
        ["NavicIconsConstructor"] = { fg = colors.blue },
        ["NavicIconsEnum"] = { fg = colors.blue },
        ["NavicIconsInterface"] = { fg = colors.blue },
        ["NavicIconsFunction"] = { fg = colors.blue },
        ["NavicIconsVariable"] = { fg = colors.blue },
        ["NavicIconsConstant"] = { fg = colors.blue },
        ["NavicIconsString"] = { fg = colors.blue },
        ["NavicIconsNumber"] = { fg = colors.blue },
        ["NavicIconsBoolean"] = { fg = colors.blue },
        ["NavicIconsArray"] = { fg = colors.blue },
        ["NavicIconsObject"] = { fg = colors.blue },
        ["NavicIconsKey"] = { fg = colors.blue },
        ["NavicIconsNull"] = { fg = colors.blue },
        ["NavicIconsEnumMember"] = { fg = colors.blue },
        ["NavicIconsStruct"] = { fg = colors.blue },
        ["NavicIconsEvent"] = { fg = colors.blue },
        ["NavicIconsOperator"] = { fg = colors.blue },
        ["NavicIconsTypeParameter"] = { fg = colors.blue },
        ["NavicText"] = { fg = colors.white },
        ["NavicSeparator"] = { fg = colors.white },

        -- gitsigns
        -- line blame
        ["GitSignsCurrentLineBlame"] = { bg = "none" },

        -- line number
        ["GitSignsAdd"] = { fg = colors.green, bg = "none" },
        ["GitSignsChange"] = { fg = colors.yellow, bg = "none" },
        ["GitSignsDelete"] = { fg = colors.red, bg = "none" },

        -- preview hunk floating
        ["GitSignsAddLn"] = { fg = colors.green, bg = "none" },
        ["GitSignsChangeLn"] = { fg = colors.yellow, bg = "none" },
        ["GitSignsDeleteLn"] = { fg = colors.red, bg = "none" },

        -- blame line full floating
        ["GitSignsAddInline"] = { fg = colors.green, bg = "none" },
        ["GitSignsDeleteInline"] = { fg = colors.yellow, bg = "none" },
        ["GitSignsChangeInline"] = { fg = colors.red, bg = "none" },

        -- bufferline
        -- offset
        ["Directory"] = { fg = colors.blue, bold = true },

        -- blank space background
        ["BufferLineFill"] = { bg = colors.black0 },

        -- bufferline split symbol (line) on the left side of the current window
        ["BufferLineIndicatorSelected"] = { fg = colors.peach, bg = colors.black2 },
        ["BufferLineIndicator"] = { fg = colors.black2, bg = colors.black1 },
        ["BufferLineIndicatorVisible"] = { fg = colors.black2, bg = colors.black1 },

        -- bufferline is not the split symbol on the left side of the current window (can also be seen in the current window, but it is very subtle)
        ["BufferLineSeparatorSelected"] = { fg = colors.peach, bg = colors.black2 },
        ["BufferLineSeparator"] = { fg = colors.black2, bg = colors.black1 },
        ["BufferLineSeparatorVisible"] = { fg = colors.black2, bg = colors.black1 },

        -- bufferline close button
        ["BufferLineCloseButtonSelected"] = { fg = colors.red, bg = colors.black2 },
        ["BufferLineCloseButton"] = { fg = colors.black4, bg = colors.black1 },
        ["BufferLineCloseButtonVisible"] = { fg = colors.black4, bg = colors.black1 },

        -- bufferline small dots when unsaved
        ["BufferLineModifiedSelected"] = { fg = colors.green, bg = colors.black2 },
        ["BufferLineModified"] = { fg = colors.black4, bg = colors.black1 },
        ["BufferLineModifiedVisible"] = { fg = colors.black4, bg = colors.black1 },

        -- bufferline serial number
        ["BufferLineNumbersSelected"] = {
            fg = colors.white,
            bg = colors.black2,
            bold = false,
            italic = false,
        },
        ["BufferLineNumbers"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineNumbersVisible"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },

        -- bufferline jump
        ["BufferLinePickSelected"] = { fg = colors.red, bg = colors.black2, bold = true },
        ["BufferLinePick"] = { fg = colors.red, bg = colors.black1, bold = true },
        ["BufferLinePickVisible"] = { fg = colors.red, bg = colors.black1, bold = true },

        -- bufferline tab
        ["BufferLineTabSelected"] = { fg = colors.black1, bg = colors.back1 }, -- currently selected
        ["BufferLineTab"] = { fg = colors.black4, bg = colors.black1 }, -- Unselected
        ["BufferLineTabClose"] = { fg = colors.red, bg = colors.black1 }, -- Right close button

        -- bufferline file with the same name
        ["BufferlineDuplicateSelected"] = { fg = colors.white, bg = colors.black2, italic = true },
        ["BufferlineDuplicate"] = { fg = colors.black4, bg = colors.black1, italic = true },
        ["BufferlineDuplicateVisible"] = {
            fg = colors.black4,
            bg = colors.black1,
            italic = true,
        },

        -- bufferline currently open buffer (when no diagnostics)
        ["BufferLineBufferSelected"] = { fg = colors.white, bg = colors.black2, bold = false, italic = false },
        ["BufferLineBackground"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false }, -- unchecked
        ["BufferLineBufferVisible"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },

        -- bufferline diagnostic information (text)
        ["BufferLineHintSelected"] = { fg = colors.rosewater, bg = colors.black2, bold = false, italic = false },
        ["BufferLineHint"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineHintVisible"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },

        ["BufferLineInfoSelected"] = { fg = colors.blue, bg = colors.black2, bold = false, italic = false },
        ["BufferLineInfo"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineInfoVisible"] = { fg = colors.black4, bg = colors.black2, bold = false, italic = false },

        ["BufferLineWarningSelected"] = { fg = colors.yellow, bg = colors.black2, bold = false, italic = false },
        ["BufferLineWarning"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineWarningVisible"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },

        ["BufferLineErrorSelected"] = { fg = colors.red, bg = colors.black2, bold = false, italic = false },
        ["BufferLineError"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineErrorVisible"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },

        -- bufferline diagnostic information (icon)
        ["BufferLineHintDiagnosticSelected"] = {
            fg = colors.rosewater,
            bg = colors.black2,
            bold = false,
            italic = false,
        },
        ["BufferLineHintDiagnostic"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineHintDiagnosticVisible"] = {
            fg = colors.black4,
            bg = colors.black1,
            bold = false,
            italic = false,
        },

        ["BufferLineInfoDiagnosticSelected"] = {
            fg = colors.blue,
            bg = colors.black2,
            bold = false,
            italic = false,
        },
        ["BufferLineInfoDiagnostic"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineInfoDiagnosticVisible"] = {
            fg = colors.black4,
            bg = colors.black2,
            bold = false,
            italic = false,
        },

        ["BufferLineWarningDiagnosticSelected"] = {
            fg = colors.yellow,
            bg = colors.black2,
            bold = false,
            italic = false,
        },
        ["BufferLineWarningDiagnostic"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineWarningDiagnosticVisible"] = {
            fg = colors.black4,
            bg = colors.black1,
            bold = false,
            italic = false,
        },

        ["BufferLineErrorDiagnosticSelected"] = {
            fg = colors.red,
            bg = colors.black2,
            bold = false,
            italic = false,
        },
        ["BufferLineErrorDiagnostic"] = { fg = colors.black4, bg = colors.black1, bold = false, italic = false },
        ["BufferLineErrorDiagnosticVisible"] = {
            fg = colors.black4,
            bg = colors.black1,
            bold = false,
            italic = false,
        },
    })
end

function M.is_transparent()
    hl.bulk_set({
        -- lsp hover and diagnostic float window
        ["NormalFloat"] = { fg = colors.white, bg = "none" },
        -- hop no background
        ["HopNextKey"] = { fg = colors.peach, bg = "none", bold = true },
        ["HopNextKey1"] = { fg = colors.blue, bg = "none", bold = true },
        ["HopNextKey2"] = { fg = colors.teal, bg = "none", bold = true, italic = true },
        ["HopUnmatched"] = { fg = colors.gray0, bg = "none" },
        -- nvim tree split
        ["NvimTreeVertSplit"] = { fg = colors.back0 },
    })
end

function M.no_transparent()
    hl.bulk_set({
        -- lsp hover and diagnostic float window
        ["NormalFloat"] = { bg = colors.black2 },
    })
end

function M.is_show_float()
    if not options.float_border then
        hl.bulk_set({
            ["Pmenu"] = { bg = colors.black1 },
            ["NormalFloat"] = { fg = colors.white, bg = colors.black1 },
            ["DiagnosticFloatingError"] = { fg = colors.red, bg = colors.black1 },
            ["DiagnosticFloatingWarn"] = { fg = colors.yellow, bg = colors.black1 },
            ["DiagnosticFloatingInfo"] = { fg = colors.blue, bg = colors.black1 },
            ["DiagnosticFloatingHint"] = { fg = colors.blue, bg = colors.black1 },
        })
    end
end

function M.execute()
    M.global_highlight()
    if options.transparent then
        M.is_transparent()
    else
        M.no_transparent()
    end
    M.is_show_float()
end

return M
