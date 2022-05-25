local hi = require("utils.api.hi")
local options = require("core.options")
local colors = require("catppuccin.api.colors").get_colors()

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
    local bufferline_full_bg = colors.black0

    local bufferline_bg_focused = colors.black2
    local bufferline_bg_unfocused = colors.black1
    local bufferline_fg_focused = colors.white
    local bufferline_fg_unfocused = colors.black4

    local bufferline_close_fg = colors.red
    local bufferline_indicator_fg = colors.peach
    local bufferline_separator_fg = colors.peach
    local bufferline_modfiy_fg = colors.green
    local bufferline_pick_fg = colors.red

    local bufferline_hint_fg = colors.rosewater
    local bufferline_info_fg = colors.sky
    local bufferline_warn_fg = colors.yellow
    local bufferline_error_fg = colors.red

    local highlights = {
        -- scrollview
        ["ScrollView"] = { bg = colors.black4 },

        -- telescope
        ["TelescopeMatching"] = { fg = colors.blue, gui = "bold" },
        -- ["TelescopeSelection "] = { fg = colors.black0, bg = colors.green, gui = "NONE" },

        -- NvimTree
        ["NvimTreeWinSeparator"] = { bg = "NONE" },
        ["NvimTreeWindowPicker "] = { fg = colors.pink, bg = colors.black0, gui = "bold" },

        -- fidget
        ["FidgetTitle"] = { fg = colors.blue, gui = "bold" },
        ["FidgetTask"] = { fg = colors.blue },

        -- indent-blankline
        ["IndentBlanklineContextChar"] = { fg = colors.blue },
        ["IndentBlanklineChar"] = { fg = colors.black4 },

        -- cmp
        ["PmenuSel"] = { fg = colors.black0, bg = colors.green, gui = "NONE" },
        ["PmenuThumb"] = { bg = colors.black4 },
        ["CmpItemAbbrMatch"] = { fg = colors.blue, bg = "NONE" },
        ["CmpItemAbbrMatchFuzzy"] = { fg = colors.blue, bg = "NONE" },

        -- diagnostic
        ["DiagnosticError"] = { bg = "NONE" },
        ["DiagnosticWarn"] = { bg = "NONE" },
        ["DiagnosticInfo"] = { bg = "NONE" },
        ["DiagnosticHint"] = { bg = "NONE" },

        -- visual-multi
        ["VM_Extend_hi"] = { fg = colors.black2, bg = colors.mauve },
        ["VM_Cursor_hi"] = { fg = colors.black2, bg = colors.mauve },
        ["VM_Mono_hi"] = { fg = colors.black2, bg = colors.blue },
        ["VM_insert_hi"] = { fg = colors.black2, bg = colors.red },

        -- rainbowcol
        ["rainbowcol1"] = { bg = "NONE" },
        ["rainbowcol2"] = { bg = "NONE" },
        ["rainbowcol3"] = { bg = "NONE" },
        ["rainbowcol4"] = { bg = "NONE" },
        ["rainbowcol5"] = { bg = "NONE" },

        -- aerinal icons
        ["AerialArrayIcon"] = { fg = colors.blue },
        ["AerialBooleanIcon"] = { fg = colors.blue },
        ["AerialClassIcon"] = { fg = colors.blue },
        ["AerialConstantIcon"] = { fg = colors.blue },
        ["AerialConstructorIcon"] = { fg = colors.blue },
        ["AerialEnumIcon"] = { fg = colors.blue },
        ["AerialEnumMemberIcon   "] = { fg = colors.blue },
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

        -- gitsigns
        -- line blame
        ["GitSignsCurrentLineBlame"] = { bg = "NONE" },

        -- line number
        ["GitSignsAdd"] = { bg = "NONE" },
        ["GitSignsChange"] = { bg = "NONE" },
        ["GitSignsDelete"] = { bg = "NONE" },

        -- preview hunk floating
        ["GitSignsAddLn"] = { fg = colors.green, bg = "NONE" },
        ["GitSignsChangeLn"] = { fg = colors.yellow, bg = "NONE" },
        ["GitSignsDeleteLn"] = { fg = colors.red, bg = "NONE" },

        -- blame line full floating
        ["GitSignsAddInline"] = { fg = colors.green, bg = "NONE" },
        ["GitSignsDeleteInline"] = { fg = colors.yellow, bg = "NONE" },
        ["GitSignsChangeInline"] = { fg = colors.red, bg = "NONE" },

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
    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = "NONE" },
        -- hop no background
        ["HopNextKey"] = { bg = "NONE" },
        ["HopNextKey1"] = { bg = "NONE" },
        ["HopNextKey2"] = { bg = "NONE" },
        ["HopUnmatched"] = { bg = "NONE" },
    }
    M.apply_highlights(highlights)
end

function M.no_transparent_highlights()
    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = colors.black2 },
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
