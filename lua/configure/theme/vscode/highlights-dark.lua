local hi = require("utils.api.hi")
local options = require("core.options")
local colors = require("vscode.colors").generate()

local M = {
    transparent_background = options.transparent_background,
}

function M.apply_highlights(highlights)
    for name, opts in pairs(highlights) do
        hi.set(name, opts)
    end
end

-- For bufferline:
-- hi          : is the state when it is not selected
-- hi_selected : is the selected state
-- hi_visible  : selects the current Buf, but leaves it temporarily
--             (for example, after opening NvimTree in the current buffer, the cursor will move to NvimTree, then the current buffer is in the visible state)

function M.global_highlights()
    local border_colors = colors.vscMediumBlue

    local rainbow_level_1 = "#FFD700"
    local rainbow_level_2 = "#DA70BF"
    local rainbow_level_3 = "#87CEFA"

    local bufferline_full_bg = colors.vscLeftDark

    local bufferline_bg_focused = colors.vscBack
    local bufferline_bg_unfocused = colors.vscLeftMid
    local bufferline_fg_focused = colors.vscFront
    local bufferline_fg_unfocused = colors.vscFront

    local bufferline_close_fg = colors.vscFront
    local bufferline_indicator_fg = colors.vscBack
    local bufferline_separator_fg = colors.vscBack
    local bufferline_modfiy_fg = colors.vscFront
    local bufferline_pick_fg = colors.vscRed

    local bufferline_hint_fg = colors.vscBlue
    local bufferline_info_fg = colors.vscBlue
    local bufferline_warn_fg = colors.vscYellow
    local bufferline_error_fg = colors.vscRed

    local highlights = {
        -- float border
        ["FloatBorder"] = { fg = border_colors },

        -- markdown error
        ["markdownError"] = { fg = colors.vscFront, bg = "NONE", gui = "NONE" },

        -- scrollview
        ["ScrollView"] = { bg = colors.vscSplitThumb },

        -- vim-illuminate
        ["illuminatedWord"] = { bg = colors.vscSplitThumb },

        -- nvim-tree
        ["NvimTreeOpenedFolderName"] = { fg = colors.vscFront, bg = "NONE", gui = "bold" },

        -- fidget
        ["FidgetTitle"] = { fg = colors.vscFront, gui = "bold" },
        ["FidgetTask"] = { fg = colors.vscFront },

        -- indent-blankline
        ["IndentBlanklineContextChar"] = { fg = colors.vscLightBlue },
        ["IndentBlanklineContextStart"] = { fg = "NONE", bg = "NONE", gui = "underline" },
        ["IndentBlanklineChar"] = { fg = colors.vscContext },

        -- hop
        ["HopNextKey"] = { fg = rainbow_level_1, bg = "NONE", gui = "bold" },
        ["HopNextKey1"] = { fg = rainbow_level_3, bg = "NONE", gui = "bold" },
        ["HopNextKey2"] = { fg = rainbow_level_2, bg = "NONE", gui = "bold,italic" },

        -- cmp
        ["PmenuSel"] = { fg = "NONE", bg = colors.vscPopupHighlightBlue, gui = "NONE" },
        ["PmenuThumb"] = { bg = colors.vscSplitThumb },
        ["CmpItemAbbrMatch"] = { fg = colors.vscMediumBlue, bg = "NONE" },
        ["CmpItemAbbrMatchFuzzy"] = { fg = colors.vscMediumBlue, bg = "NONE" },

        -- spell
        ["SpellBad"] = { fg = colors.vscGreen },
        ["SpellCap"] = { fg = colors.vscGreen },
        ["SpellRare"] = { fg = colors.vscGreen },
        ["SpellLocal"] = { fg = colors.vscGreen },

        -- visual-multi
        ["VM_Extend_hi"] = { fg = colors.vscBack, bg = colors.vscPopupHighlightLightBlue },
        ["VM_Cursor_hi"] = { fg = colors.vscBack, bg = colors.vscPopupHighlightLightBlue },
        ["VM_Mono_hi"] = { fg = colors.vscBack, bg = colors.vscUiOrange },
        ["VM_insert_hi"] = { fg = colors.vscBack, bg = colors.vscDiffRedLightLight },

        -- telescope
        ["TelescopeBorder"] = { fg = border_colors },
        ["TelescopePreviewBorder"] = { fg = border_colors },
        ["TelescopePromptBorder"] = { fg = border_colors },
        ["TelescopeResultsBorder"] = { fg = border_colors },

        -- rainbowcol
        ["rainbowcol1"] = { fg = rainbow_level_1, bg = "NONE" },
        ["rainbowcol2"] = { fg = rainbow_level_2, bg = "NONE" },
        ["rainbowcol3"] = { fg = rainbow_level_3, bg = "NONE" },
        ["rainbowcol4"] = { fg = rainbow_level_1, bg = "NONE" },
        ["rainbowcol5"] = { fg = rainbow_level_2, bg = "NONE" },
        ["rainbowcol6"] = { fg = rainbow_level_3, bg = "NONE" },
        ["rainbowcol7"] = { fg = rainbow_level_1, bg = "NONE" },

        -- notify
        ["NotifyERRORBorder"] = { fg = colors.vscRed },
        ["NotifyERRORIcon"] = { fg = colors.vscRed },
        ["NotifyERRORTitle"] = { fg = colors.vscRed, gui = "italic" },
        ["NotifyWARNBorder"] = { fg = colors.vscYellow },
        ["NotifyWARNIcon"] = { fg = colors.vscYellow },
        ["NotifyWARNTitle"] = { fg = colors.vscYellow, gui = "italic" },
        ["NotifyINFOBorder"] = { fg = colors.vscMediumBlue },
        ["NotifyINFOIcon"] = { fg = colors.vscMediumBlue },
        ["NotifyINFOTitle"] = { fg = colors.vscMediumBlue, gui = "italic" },

        -- aerinal icons
        ["AerialArrayIcon"] = { fg = colors.vscYellow },
        ["AerialBooleanIcon"] = { fg = colors.vscYellow },
        ["AerialClassIcon"] = { fg = colors.vscYellow },
        ["AerialConstantIcon"] = { fg = colors.vscYellow },
        ["AerialConstructorIcon"] = { fg = colors.vscYellow },
        ["AerialEnumIcon"] = { fg = colors.vscYellow },
        ["AerialEnumMemberIcon   "] = { fg = colors.vscYellow },
        ["AerialEventIcon"] = { fg = colors.vscYellow },
        ["AerialFieldIcon"] = { fg = colors.vscYellow },
        ["AerialFileIcon"] = { fg = colors.vscYellow },
        ["AerialFunctionIcon"] = { fg = colors.vscYellow },
        ["AerialInterfaceIcon"] = { fg = colors.vscYellow },
        ["AerialKeyIcon"] = { fg = colors.vscYellow },
        ["AerialMethodIcon"] = { fg = colors.vscYellow },
        ["AerialModuleIcon"] = { fg = colors.vscYellow },
        ["AerialNamespaceIcon"] = { fg = colors.vscYellow },
        ["AerialNullIcon"] = { fg = colors.vscYellow },
        ["AerialNumberIcon"] = { fg = colors.vscYellow },
        ["AerialObjectIcon"] = { fg = colors.vscYellow },
        ["AerialOperatorIcon"] = { fg = colors.vscYellow },
        ["AerialPackageIcon"] = { fg = colors.vscYellow },
        ["AerialPropertyIcon"] = { fg = colors.vscYellow },
        ["AerialStringIcon"] = { fg = colors.vscYellow },
        ["AerialStructIcon"] = { fg = colors.vscYellow },
        ["AerialTypeParameterIcon"] = { fg = colors.vscYellow },
        ["AerialVariableIcon"] = { fg = colors.vscYellow },

        -- bufferline
        -- offset
        ["Directory"] = { gui = "bold" },

        -- blank space background
        ["BufferLineFill"] = { bg = bufferline_full_bg },

        -- bufferline split symbol (line) on the left side of the current window
        ["BufferLineIndicatorSelected"] = { fg = bufferline_indicator_fg, bg = bufferline_bg_focused },
        ["BufferLineIndicator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineIndicatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

        -- bufferline is not the split symbol on the left side of the current window (can also be seen in the current window, but it is very subtle)
        ["BufferLineSeparatorSelected"] = { fg = bufferline_separator_fg, bg = bufferline_bg_focused },
        ["BufferLineSeparator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineSeparatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

        -- bufferline close button
        ["BufferLineCloseButtonSelected"] = { fg = bufferline_close_fg, bg = bufferline_bg_focused },
        ["BufferLineCloseButton"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
        ["BufferLineCloseButtonVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

        -- bufferline small dots when unsaved
        ["BufferLineModifiedSelected"] = { fg = bufferline_modfiy_fg, bg = bufferline_bg_focused },
        ["BufferLineModified"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
        ["BufferLineModifiedVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

        -- bufferline serial number
        ["BufferLineNumbersSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineNumbers"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineNumbersVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline jump
        ["BufferLinePickSelected"] = { fg = bufferline_pick_fg, bg = bufferline_bg_focused, gui = "bold" },
        ["BufferLinePick"] = { fg = bufferline_pick_fg, bg = bufferline_bg_unfocused, gui = "bold" },
        ["BufferLinePickVisible"] = { fg = bufferline_pick_fg, bg = bufferline_bg_unfocused, gui = "bold" },

        -- bufferline tab
        ["BufferLineTabSelected"] = { fg = bufferline_bg_unfocused, bg = bufferline_bg_unfocused }, -- currently selected
        ["BufferLineTab"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused }, -- Unselected
        ["BufferLineTabClose"] = { fg = bufferline_close_fg, bg = bufferline_full_bg }, -- Right close button

        -- bufferline file with the same name
        ["BufferlineDuplicateSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "italic" },
        ["BufferlineDuplicate"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "italic" },
        ["BufferlineDuplicateVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "italic",
        },

        -- bufferline currently open buffer (when no diagnostics)
        ["BufferLineBufferSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineBackground"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" }, -- unchecked
        ["BufferLineBufferVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline diagnostic information (text)
        ["BufferLineHintSelected"] = { fg = bufferline_hint_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineHint"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineHintVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        ["BufferLineInfoSelected"] = { fg = bufferline_info_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineInfo"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineInfoVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_focused, gui = "NONE" },

        ["BufferLineWarningSelected"] = { fg = bufferline_warn_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineWarning"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineWarningVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        ["BufferLineErrorSelected"] = { fg = bufferline_error_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineError"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineErrorVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline diagnostic information (icon)
        ["BufferLineHintDiagnosticSelected"] = { fg = bufferline_hint_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineHintDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineHintDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },

        ["BufferLineInfoDiagnosticSelected"] = { fg = bufferline_info_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineInfoDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineInfoDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_focused,
            gui = "NONE",
        },

        ["BufferLineWarningDiagnosticSelected"] = {
            fg = bufferline_warn_fg,
            bg = bufferline_bg_focused,
            gui = "NONE",
        },
        ["BufferLineWarningDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineWarningDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },

        ["BufferLineErrorDiagnosticSelected"] = { fg = bufferline_error_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineErrorDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineErrorDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },
    }

    M.apply_highlights(highlights)
end

function M.is_transparent_highlights()
    local bufferline_bg_focused = colors.vscLeftMid
    local bufferline_bg_unfocused = colors.vscLeftMid

    local bufferline_indicator_fg = colors.vscLeftMid
    local bufferline_separator_fg = colors.vscLeftMid

    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = "NONE" },

        -- bufferline split symbol (line) on the left side of the current window
        ["BufferLineIndicatorSelected"] = { fg = bufferline_indicator_fg, bg = "NONE" },
        ["BufferLineIndicator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineIndicatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

        -- bufferline is not the split symbol on the left side of the current window (can also be seen in the current window, but it is very subtle)
        ["BufferLineSeparatorSelected"] = { fg = bufferline_separator_fg, bg = "NONE" },
        ["BufferLineSeparator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineSeparatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
    }
    M.apply_highlights(highlights)
end

function M.no_transparent_highlights()
    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = colors.vscBack },
    }
    M.apply_highlights(highlights)
end

function M.execute()
    M.global_highlights()
    if M.transparent_background then
        M.is_transparent_highlights()
    else
        M.no_transparent_highlights()
    end
end

return M
